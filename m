Return-Path: <linux-arm-msm+bounces-107819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJnKMDYCB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05C54E53F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E39C930A7BB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033F6477E2A;
	Fri, 15 May 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDZDMFNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsoHlJvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F474779B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842628; cv=none; b=XY4Esob0PtAduXUqDPr6t6PnDhDss5k3siRX4K5Oc0OVzFWicSK4Y1iiEBR3PTgoNd9AugZrKmMFeNf2p2h6YoqwZ4xmC2hvxwjjmacuHXKBPfzsAPdiQG0xDpL/TMeplJJFRpC8GgQQUCxEu8zuuGHiO0df6Q6v7+MHXwmG0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842628; c=relaxed/simple;
	bh=gbCeaYueb4U1C77ekL2Y8TdW7/dkPJFAfNT4ZOSKnSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5htkmkIbyNhd6kIoGat+8zAUrewe8eKY9gSN3OjhFTzc3EHyzu7v0wdq3fbECJXCUjjjtnbt9WIxXoPAp+xez6x//QsH/JxbY3WGY+hlCDluu5IWw+CC3LDMkrDPyWbk0HVqR+m+dUnjKCZcbSfzD2JU0JX192jARMPVkQvT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDZDMFNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsoHlJvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5WiCW4008290
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPKz/HiMLs53acXB1JMSjHsFsUjIwUH4RFDs98hoyA8=; b=UDZDMFNMrbZGhPao
	cTnogM+rZXlQkIBdBYdLOPBs9eIxerykN2lvqlvTJUedz0z5tB6GggZZKryPXlnV
	cro2gdDnW8LKcbFKGHBDIQ3Nvnb5Gz+E6xsb/KPo2nRcp69JKW8m1YqZdRj99geK
	aQGwbPPcNqNfCElL8b6InWFqJsk93FkcqUnmDLU2JHg1CS7hFvwynPqnG6ZwdvTI
	5RjjoqnC34ZcxdJ1nWsTB9gnkEdEf4ZfnCN6vBXY0zgVrUl8UyPHNfmsxKJ5Vfru
	HtnvFhnoBDYw5R5aonKFE1mIYTg7Owp5bolKKYrSXP9brOUx+cJLQS/0grmHGEbl
	TIpXfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stxrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:57:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso35094321cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842626; x=1779447426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPKz/HiMLs53acXB1JMSjHsFsUjIwUH4RFDs98hoyA8=;
        b=PsoHlJvxxo9+oVSd54ERB9GAwJDFSwFXtKZFIySAyhZ5+a5yXfT/YqhoEG1lbJvwzy
         HtL8Nm0ACHLuk3DIr0CJ6yCa+rLB7yVAUBKmj4SOdlXafkDAAwIdhEn4IK0VDmwOdi1C
         ssxMa4sfp5AP24Hu+VgVKmSwPFdlgeGXoaw2HqFhdtfIgplTZu7PGZPUDSTgmOSALPME
         OB7FPy/SfI0UShsIU+1Yh9fR3bdSt9oKdn+oYaex8EHmMk3yOJgBhoaww/i1g8+tPkjD
         vlnRD8iqlXzPmDS/X/4npoldIAYSpMejSW1QrdEgQcf0cG6LOCi6CTp1ygKElFUfBeVI
         +N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842626; x=1779447426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPKz/HiMLs53acXB1JMSjHsFsUjIwUH4RFDs98hoyA8=;
        b=i+5Pp+5Hws9gOrcba7oPXr8+BAoctOBcDl5FoMbQeMIa5C/yvYh2QWGgOkUNOAFIZJ
         xVAj+yTX0kx3brWyXjCMTihscxeKo7fQJnVJ3pkLSk8ilX2QMJHQ/GPLsdO4neOdofRA
         XNEzmIgDiCoL6aPxiSvPUrX2MN/5XVWK+BUgzQi9ZBmO1BZ09wBHvRaX7Y9qFzCekxxz
         AW7UzVdW/2I0FOKZMNhMbB/sKwf3uysN+m+7n0w1X0t4IpbIt8Zm5wzQXBLi7ZCCLyg0
         2RZ6BsoZ/k6jVpbIUgSZw9ol4Lgi6IfKxcm6dQTsa4v2pPl7mmqJLtLr8/ubH0Q4Z3PV
         F4pw==
X-Gm-Message-State: AOJu0YzJQH2MRnDju23qSOdZbLA28qZYG5GExYbQpDN2may9DqUhRipd
	6igbpOLx956tPxxUcQ20f5aeV7R9MSNqgr9KXuonCMLoz2iZKoIX+iTzuSGnmFqKMp9j9/aLq/l
	iwDgohUL3mR7HFHyF+A4T5pQij/raFPYyclWVBDHcMKPLId1yu5TTx5VbQH0xRx11YpSe
X-Gm-Gg: Acq92OHBwkArl3v2zqT2JERbQ6c3Dz1BVZ2bbha6I5zJmcuOYcWg9JLhQ1fu68SLG8A
	NRf2rRyJBvMv7asCnCKlqKJw0QG2SvJV/rrVgt2UK3E03WgxylEALum37ZkrmREVPaG8Y5Jm/uI
	iVpxhO4rxysVxJe9skUk7WFA1/qXkvw63BPw7GgO591VnS88KoqO5QCo3ez3KAZd8ZUiUyXRMwb
	qMtkZt3ar1i+KDZ4QakJwFMgO1vTtD9y/07Qfc13AP8eyv6p76zht8b6wUu5c5eKCWNrIAM4bJz
	9uQkkF1NKGxAvNan5Y8+vl0Cg5JnTBYLrHahsF3O1tJOs6L8Swn6U5u5sCC45PLuydxR8yTnWEf
	w5XbwcL/Jc3jeJHperGG2/tbTXr4INXGWfYriYu5h39jP6R0AIDDayGfaV7b6TbvdVHkfTMEj03
	JmvyQ=
X-Received: by 2002:ac8:5945:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51659ffa7abmr33292921cf.2.1778842626278;
        Fri, 15 May 2026 03:57:06 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51659ffa7abmr33292501cf.2.1778842625877;
        Fri, 15 May 2026 03:57:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f6bsm1834858a12.17.2026.05.15.03.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:57:05 -0700 (PDT)
Message-ID: <826835b8-e760-4b71-ac90-4245c0878594@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kodiak: allow mode-switch events
 to reach the QMP Combo PHY
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-1-c3a703cc30eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-1-c3a703cc30eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UxoEUPnTTleNGEGl0RO-hqydS1K-zzMh
X-Proofpoint-GUID: UxoEUPnTTleNGEGl0RO-hqydS1K-zzMh
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06fc02 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M33i-PvshYg3drt0OFQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX7GSkLMmBdwLG
 cORoBu3FaDiOocAVo51Vh3/sC2KOziTfUx26RszoKxW32l/wBoy0AXyNaNGDIGMjm3+3PmHREsy
 WHINcZfX1ohmIqbG2NsKvwp6zc5RT/8kDQYJIZT1PIMRS84je9TxWHLpeUHPV1hm0JZtLmB4oBu
 yu+IVE5RhlXD3yMZoeYF2CONK/n12oK1DB9b5tZyj7LVlePZFftpxNnhfQocES544acZ13yMda6
 LXY6QpPnTgKjYNjBFJSPn2uaVdWoMz7E0eSXJlox8zuQXIDmJ+4Hes/64NHJiAXW5Lh/WHDbGvl
 F2lPdbDd3W312/mXUvmViRv9TIqzV286XE94v93k5w/n3opoM77K9Vp72d0gaBuMouP2wjBKAZr
 uT0j0ILb/DFqY5UB20VHF98PmeDPGt94NIt7QIsvPCeMCv4BEYBCu+HModzxA+FpgX4vL2gtt1I
 U62KtMbGG61JLsVvtAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 3E05C54E53F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107819-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/26 8:40 AM, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> Allow mode-switch events to reach the QMP Combo PHY to support
> setting the QMP Combo PHY in DP 4Lanes Altmode.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

