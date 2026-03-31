Return-Path: <linux-arm-msm+bounces-100994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBB4FZmQy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:15:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4F366D10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96AD33031BD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3033ED5A8;
	Tue, 31 Mar 2026 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAtSHiVd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+PLGMpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3773ECBD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948392; cv=none; b=qM5l03zIV6Dm6kQiMHBgfQVBKF/LnpgvYzQRxf8sZo9L4XYlYcwjFh2TMjnMY5JjlP9kewqddWm3EzUdUDE1cdf7whD5SSnhjRCKN3I4/hR9xpFS3kXRAHJ7MHW61X0BLegLlj4U5FPBw6CpJJkPNyA1L+gyRjSY+5/hLWObhmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948392; c=relaxed/simple;
	bh=Bdo8nbx3rVkNTL5HDnpcpago/e2UR44Mc4Mq4d7wBRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWqpLmNwPb8Ep4hloXemxLqzbWoiyealgAgkD2pRn385/Tr7vjECpEfVvZV5SYBH0BmIkMZPyYqeP1lAuA3QO70Kz1O8of2jr3c9ujlu8Me6mGXYGENfUoAlIkLbfibA8eLqezeKbxPv6t7LOPQ0D62hEWGJhrt5mhz2w1/qo2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAtSHiVd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+PLGMpO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5IVSU1090544
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=; b=DAtSHiVdRmd/EIvS
	btT2wXWxL3qxeTzHq9TDsePKtAHXsKPJZVC4wtCHo9SB5z+Uj6M5Svt+svXCG8YM
	KlbPrhNAP3j69zFYb3AYTeT90IsPAr600rhJbgzdfgTt2K4DrG0v1y2OHNIqD4Pp
	N7lVdnZUByL6Z4uKkOT2qV4vattaW8of2mygwyPYQZKMsHtAvUwydeZpqRkjp1kR
	gqvmG9Jjk7Z/E3Ai83OZ2muNL5UR9uARiCruyVHJea387W40yC9GlxqUUgpeGHdB
	00ANadrHfTEJaLVOEdPoMiuWhuGkpMyOCtzdTRJja3KYg86s1/nb7DdX6rjslbWs
	7htmUg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd3y2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso4083484b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948388; x=1775553188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=;
        b=G+PLGMpORUzSK7iGAnHJ7j9u7pzJ2IjKXwDkQrSK+WHGtvQzRp/eP6NeOLVeYU405d
         AMDAh+2190oH1z8ghL07pmUpv+DYgq6jp3W8fC3NJZcys6Bk6Wbgb0BU7Dzn4mhE7u3D
         ekRqEKbASXBMsFmO4+FjMK7A0jNqPd5bwN6V5KYS3pgvEf3rN+zszxek2dx0UVvbQ/Kw
         dGrwlsr1UWMBcuUkTVXdbFbZfQSvw0qd6kzjMun/RIbKx/0ssBNkmvgFl4pKPR5zTTGH
         HdL49K63771ek5XHPib2JSjW9rLqNi+fyiDuQcpRt9wWYjeNLohxQ062LbOGJGN6ORoP
         2oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948388; x=1775553188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=;
        b=BYvJJA8qH0xrvFtXu7C3WqVAP+CAX9qFSP2/5tfVHd7XJm17+L2BtgYtLi8bsOYrBm
         QWo8yN2sbL3hW7I9G8IaulohW+fspK1XvQkwpgRZJe3XRLyMT7kMmflg9u8RmpObLjjQ
         eBRhSXSgg+EMDCYznU7R3/pgKzhgRKHsd+NnId92Cl6HHe8QHOYGGxnptE4M/iQjWGYP
         UytpQgUxHm9ncJjIwMV5VtIMIMZl9qBkSVnW0H9oyZYSfvrwq2PCJZaXEV/lIkP+k0rx
         ea/EaT6Spht0pPUP2u83nZ89EsWqR43Aom8paVHbkcp44HVkpMP46q2PtYarc+I+LFkF
         mhkA==
X-Gm-Message-State: AOJu0YwtTNfaen2bRGl9NedSxZu9VRrC9+AVFpTZFVMO2JZoL/kukbyM
	Pq9I99Ef0V7J73/Msn6Od1xH3u46PeXdngEqF1cj7UCZTR2DPnSjulx+AJ0bqQE/5jOnI8+n/eB
	StxlngGOa/TU88M0GWAFTUSFa1PuoGW9GWJY4z1iDJj18EHgFzKaITIcsDnnvWBYOusWs
X-Gm-Gg: ATEYQzwfpDWBLDXhFNdOP1eVgS4zwY+e6K7jZ4q7grhAnK8iNBdYHyaSHrS459jnfoA
	lRQQfs8rVnFkR1bUBqDjA0GHTjO/Ly5ScPYFOUq8vdZlwdyBuRlcuRv/7Hj2eouEnKlXARMaNO0
	fozeE2J62LTjiKkO0XX1uvyHexJEU4ktU5qG75GXCWTSZMX09LPs2205xqye+/EwhSkX03e+TwZ
	s3Q1Kkup/A9EuIxtPe5M9sioozxCLaw5DNmqFZuUxsDUO6kZCuYARMZRjIHOp5Ebrg1qg4E5yht
	SNPSusn0IjDci2sfSa9VkERTHdLy5bdAaHTJqX7w7dCAz44BBs8ClPh16++ZJaCVO5GLuFg3hK6
	K002R/jz5ujHoYPW02X0fwngON2NsKWIdba2s+lLU5z2jr95Yow==
X-Received: by 2002:a05:6a00:299b:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82c96025997mr13153915b3a.36.1774948387597;
        Tue, 31 Mar 2026 02:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:299b:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82c96025997mr13153874b3a.36.1774948387127;
        Tue, 31 Mar 2026 02:13:07 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm11106538b3a.7.2026.03.31.02.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:13:06 -0700 (PDT)
Message-ID: <aeddef2d-2d61-4fd7-b25b-9eec8e2fceaf@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:43:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller on
 Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j91EGjiGgppDXvYXby0gmdyBDInByH4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXz2OYpw+9UIM6
 jpF8I5gsGfYF/EQ/8a5S8fMh3aQE69G549cVl3ET6k/N9l0+kK8a9p6TwgctP6hErGsJA2lqJu2
 pZpkJPFX5+nduR3XhHHVm/jUoZUXzw0G/L+UwKveimWVZ5A40Mxr4/72Y7Vr12Kt91GOgJoha3q
 +9mKN1dXuuaDuZ0w6lfrZRr4yMmthPM2NsZEdxOYVVBl63uZezLzfFbfwHPGthwkLDQ2c5r4Xnj
 Yq7z55L7ufDNUHUpfnmyU1/PJPY3pDkUpMaZ+YefiCROE/1z/O9Ia1bioAFy/cJlEIfkM18G9eh
 pfvEFgmFQCUh688n5QwY26LyIBs6lTkj+6bQ9H13ing7B3jf3qkGDsn3lPKJZhgO9fTsbXyxx6/
 TmzhjA9Z59BsgPEnXwZkBVHOEwj4M9z2Gt6KTeokiQua0pDWoh4YQTMAmPyxzjtlMU/wKqCczFh
 JW0gpoWvNwdU+k0v/Qw==
X-Proofpoint-ORIG-GUID: j91EGjiGgppDXvYXby0gmdyBDInByH4Q
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb9024 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yIexR1LhTexBxIJ9UtoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100994-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EA4F366D10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3656 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3666 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


