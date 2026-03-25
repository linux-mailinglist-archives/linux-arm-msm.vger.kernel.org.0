Return-Path: <linux-arm-msm+bounces-99797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP/VOo6Ew2kPrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:45:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164A3204C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C4D3032F74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5EA359A94;
	Wed, 25 Mar 2026 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6vqYvGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPMKGCe2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A6735838E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420989; cv=none; b=l78HU1rQmlI4k9LU93P1RoaMMmmf0nb3Q1AQQgZkU+PuoqO2pD/iMRbLh7OG4DvVyMpOI91HBED5bnlw7wDazzBNeAPn1W6Gi6YlLvmvtCP5/Pqsj+Ea31l0hOqSQH7n8cMzA8gkEklQz+3CpAlZ1iwrHuf61qtRbnDTVrK0kWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420989; c=relaxed/simple;
	bh=JasCI1yX7osRLkToT6GCE4aF7otUG3SV9cx5LFSW8ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I26ulypmtH+hsS5+vy88dPpFCARvc7QhuBUNsH30AWlZYxGCR53O5cKcsi8tJNmqWMBlmHFZh4mnSWsOBzyy/3NlbZdpR7eXxWDclfRwLoHZ/QH4yjYhHtg0KNFUi5YnimIKuQtFD8QaYlZbB7akGNzbder7uSilGZkFYg+SHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6vqYvGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPMKGCe2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JBD03057387
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iprtSxBJOHuVEk2TVxztxYPzYegRSDoPkW6NGohZoQc=; b=O6vqYvGtcrBwHtRC
	6JDVWOa5Ge4cwaZaQBWu85+lng87ig+ij8Yk/wXE/9StrMKB568LuhRwxT4zG9Gn
	HJWAd3com5sUcU/24IPZsllfaeU3aWVqclbg26Q3gz5W152RwXkvZRGFxbOUYXDT
	thZ8i4vdAfmhWFnDtwGIULT0I92Rtff7/ZT4zV9hI+XplfNh4MKXPpHJIZpjw0/6
	aImytVF3yGv1KjrLUxplwIxlQegxSqO8KI7SLrgxanrZJb7w13EYJOBU8X3xwrwQ
	xE/ClIZavJOLtsYBpFJ9zdtJoRKBapHCAMtYX9eQjJuCRNNdZTQiLFnDBJ1qfjIV
	bsHRZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0rgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 06:43:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b90fb083dso4188043a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774420987; x=1775025787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iprtSxBJOHuVEk2TVxztxYPzYegRSDoPkW6NGohZoQc=;
        b=RPMKGCe27kdvcahKPWiaKgEFKA/wuxDv6DGLW34G/M9tjJxc4RvLNdjErr62pyj/vD
         OG6oW0V04oOFmu+doYKqa38iDQLvVBdTMuIe0BRzDjlTOPcByuxBVjhpAwyGhzcyv4Tf
         Gj1MHXGM3iRK20zyxIj64BDt6A/1pySjFYTK0jDcJ+gB1SWhJEkVYDaz4EIRbTJjl8Tr
         R3rMeOWfji67gZcCgsXjkTHnS0eSVMYUKh9LOxzat4Fg4E3udLGBzpGZGX5QIe+uqiz2
         s0ve6c3K3D873g+iGYS8e7hfIpbclPYnoEOlWuTMNmmwvc+bpvo0uFj0R5nMX7Wx3Lc5
         5oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420987; x=1775025787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iprtSxBJOHuVEk2TVxztxYPzYegRSDoPkW6NGohZoQc=;
        b=BcesDI9MCcfPSkrODzIx8RhwvyJZovU44Z4+iLiuYQixT1nN4DGAJuKrrBs4Fmq++v
         aYsaTzW9QcVqTBcPcFt32oH2pS6soC+5mhmV8E4t2SQ1G+UqwT8Pj3tXIDosfNbMSJCj
         sy31bxbNbbFUQ52fgifAR2PJJYEtd01aeh2gxQwYtQwmfT7/XWBID+MZ7zd3QrnhtaCf
         K4Kgtiqa8G2SjU/wduS8KEoBGuFTyiBbIEBbwSX9Ka0KS+JcJXdqIvJQFvSpnau7PRxX
         2WhaLo5CfCpxfnaSJfNtxfS8d3H0wp0OHHeCfQVVl6RiOqpsdMnzeJMphdlb+aSGlFWS
         W7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOqZbpfEcfB+BFP9ilD5qOZLPNAP72bCTVN2suwZ6vr8Y1T/93Bl8fYJRXUZbelxKcrPrSxK/RPwhyVuL7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtdg39P7GvsbIswsVFYfyrChZQkZ+qAk2q/401Q433QV7P4I6v
	LIO2zVhhEDXWh/T5tanmPO99/YRSe3XIYiYsN/aeXdrUQCy/Ws6dEX90N2PEkD5GPAnbzTk2ZhD
	mWvJo1YWsU0P1uz+sZ4QhY+5OxKzBKQolcmBU05RW6rLgUs4EBKRme7ZYZHxHHYvUKoYQ
X-Gm-Gg: ATEYQzwCfLxXZ9oN7IlsVYkIHi1lLS/Js6zW2mvm1I2Jd9Tcb7/O0E8CHifiM+d8u1e
	GMc036+gvu19jIeo8IEqxWkzF3z2tVDV7Wyrive9SHfSnhnPwgJI8KdJw+NrlcswauKO9rCMA0Q
	1oBvxaz674O8rB36tfhwmhvxXcpFWzZIARQ3C64lNnw1Pirja2Hvc2D72qmqdr38yEV7agrS9FS
	fJXAO2ueARrvWidKl7v0GvATJsUJJMhhhYM6lQ3l6S89PQr3TUyEEK9Vb7Dj6U+2kf6OxZfywmB
	KEjbZIsJXvx1aTymwVl9FU7MvomLNpB06KcOOGFoY/6aUt/nos4DgtqgHpLt2K5UbvItHlGgzmH
	G7f8LE68XNvo64w0Ch7UvDUHJZcBu+DkDyZkjEBlgtbo/BP8mKsEV22Jh6NQnAKTDyOCmG2w9VL
	69uPmu9TeqLw4=
X-Received: by 2002:a17:90b:3fcd:b0:35b:a760:1a44 with SMTP id 98e67ed59e1d1-35c0dc796afmr1487525a91.2.1774420987004;
        Tue, 24 Mar 2026 23:43:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:35b:a760:1a44 with SMTP id 98e67ed59e1d1-35c0dc796afmr1487501a91.2.1774420986546;
        Tue, 24 Mar 2026 23:43:06 -0700 (PDT)
Received: from [10.133.33.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0dc2a13dsm647589a91.1.2026.03.24.23.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:43:06 -0700 (PDT)
Message-ID: <79347f14-29f4-4f8c-aa70-25a8bbded0be@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:43:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EqaxG_C7n0lgAZfTTS_UhsUm3Qdcg_53
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c383fb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=kcT8zHn9ULDl9SQ3-_4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: EqaxG_C7n0lgAZfTTS_UhsUm3Qdcg_53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0NSBTYWx0ZWRfXyCWAIptatb2L
 g/M+ZJO6kCTWD7yitY0JqMWR60+JKG6P5IOlnO3XYzMoDZ4oLSgWBNxahcWglT2oDxqaNDjTiDN
 UbaZpVtAsmcYJEHxuAePLS+YGbwwCP/39Alpv6QshidK+EYjrwcJvXxeeIvMDZ8gfTyhOoF+HQR
 1Z2yAedpt7M74RFiFKWlIb08CAZj/0UeX3QF5Mw51qph8jeOhiwLCmGfeOFQGYGusQChOWBDDvY
 Idn9tvheilHSWmjrwv2uUAfCJ9S1myCcKOy9V7DZHwPvMcLo3dHnH4JVLrL+j6ySAiDg/HdovOs
 0g79s/aD6cEBkKoqC+kCCmUoI4mf+Cl+LEfw9pppyy9Oh82GaDVTWttcSTNB+SbKck2ged9vS9S
 Z8Rv74YPNSgkDv7mUg0Bq0GWkY2b7uC2rRXTytAqwGx/GRI/7lvv9y0jCRCIEY5f8dgNAw1jBdN
 ae8H3HoOhLLLQ/MYKtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99797-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5164A3204C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 11:12 PM, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sending as RFT since I only tested this on Glymur CRD.
> As far as I know, Mahua CRD uses the same WCN7850 board, but I do
> not have (yet) access to a Mahua CRD to test on.
> ---
> Changes in v2:
> - Rebased on next-20260323.
> - Address commit message issue reported by Zijun
> - Dropped the vddio1p2-supply as Zijun suggested.
> - Did not rework with the M.2 connector since the E Key is still
>   under review on the list.
> - Re-worked so that it is done in the generic CRD dtsi in order
>   to add the same support for Mahua CRD.
> - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 118 +++++++++++++++++++++++++++++--
>  1 file changed, 112 insertions(+), 6 deletions(-)

Reviewed-by: Zijun Hu <zijun.hu@oss.qualcomm.com>

