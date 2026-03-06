Return-Path: <linux-arm-msm+bounces-95706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC5WLsdIqmlkOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:23:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A621B0B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 100B03023367
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 03:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E6636997B;
	Fri,  6 Mar 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdOtMXE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jjlJMqpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A708436C0C2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767376; cv=none; b=ovnU7zu++KF2MfP8bou4J1SxVAU1GldlW/4UXykwuj6EByhdOjjUQb9GgXerxaAbkPASwdiFTitmVxob4cnTA1scFbKI0B38xqJUJ/kSJJQtJZ0Erps7z2/DhB1qwdGiIwXThvRYNUfXVUiN1S0MCBLf61/vsGV6XkX287FfK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767376; c=relaxed/simple;
	bh=qhKCBm17VvGNVCEd8eb18I/FqyEyctWPk6UfJsoQ9Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBsHfb+wIGz4FKau75uiGM8fX8MbsQs0MxV4zBlTk5hWI0O/4VdWTmyVNSnfDyZZn6z0ENzDJQp6M8kzzIVgvNniQUlXB7pLCrV88qThCmakD0uYkCSW/FGuXhQQ/WcuBFU6AYQXwWEu78ZM+C8MstKJAKiYvhAcy2jK927E76k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdOtMXE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jjlJMqpE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6263Kb7s3138783
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 03:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00ObHD+E7m2TSNqqkJQMwTsT/KtwWgshBLMBpB6Apt0=; b=cdOtMXE1b9vuAUzU
	bL7hF2les/8fHbIrffmMh4hjt/64Iforz4WcGJFTvwS+PlkfrzE6I91oRcIGLFDH
	oS4kfVxZViX9RIxGJq8oaTM8Xd6C0eWFOwfOp9NYy3i+/6HRcqRZwex0rW+ZO+Ea
	GLCnzfi3gE4IpPQ1VsUmDdWa3CPlFTxpQIZxoM53jR7QDjx9FKN5AeezIFMSZmR2
	32SjxbnxappB0QVSmLYfYH3raF3OYOUXRx0k5+vWC4TaWO+U3RAH/UiB0+064KuB
	WLE8JpQC5xlN7+qke+0fhz8MI4DWAuqFCJt5y6ESMgJLoeysuRQ0VeUmA1l1c9tJ
	P+mIWA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdr04e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 03:22:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae502a1dd9so64332545ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772767370; x=1773372170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00ObHD+E7m2TSNqqkJQMwTsT/KtwWgshBLMBpB6Apt0=;
        b=jjlJMqpEpiELmQxyzPnjVYLPL6Eb+Qu0w6MMzTx7h1iB3FgqeFTRMFMsqh0mCFWg42
         WmdqfvznyovtYaCniu/jEA27XxTOveI9C/INWPw9CjQYnlTVCPCUKVOeXZHayfMOgVJ7
         /kY9vlYyraLXGmt//9Jh21IpL7Ls9cCkSTXQAOgg3gi8s5s4qInPzNzQ2JqV3RckD5/P
         fvUQ4ixkJhfLAog919rjF5h3vGQBn7HfL9BddHjUHIYB1PLU1s5lKVocEueMe5PMaaNQ
         gOCzjICEheQbSSXvt780eaGaYPGPsj0Eltrp92BOXDMklV0qVcfOz04UANMYYl+OLdPZ
         oA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767370; x=1773372170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ObHD+E7m2TSNqqkJQMwTsT/KtwWgshBLMBpB6Apt0=;
        b=ZyNRASZe8rXKMMZWvsdRNSX24y0L8hGxrxlfXx7LCh3IyblAz3XFVvfsn+dsK9S9rP
         sTWCz4G3lZkZXZXW0SafFJtqZb7Yr/+AUhVl9ypaXSsTiaxc7p858+RJWar40w7EzY9R
         VZUZdcD27jbC6ygTFI/ofvuhsSJEnXqBiVMFDFdX+v9gzb6qvk+tHZjYQRuNT0rTDu7z
         aAkcl8/mGDdlECdynUpfYxwjmYPo76suNjucNTA8JemmCM/hjnOzXNz+qB86n1cKfomb
         rxwjapkQm657Z6hFsw3mR7j47sD4q1XVQ9NC3Yvk7t3+cMTUKGnZEXPyMcB2nCu0nTjo
         n9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVMz5x7cE+gi784ndwZX09ByXnZFBhypGWFOzfo99bhuU/F1VSHhYs8UR6XlMnOnDl8xTQ6I2UogDNpsO2z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1OP21CZ4/y8lx88Zn/t3tllQ4zslmPidQW9hlig7KouL5HUa
	7ObhILCxm1simfj0ICGTYJ7XFXHyuvDyMKzpojh5hCtLT+/h2O/UTQIL1ZsghMEFDLNdm83EApK
	MgsO5DPDcdnZ8+HGzVGVT8eW4kxOEeeoZfe1ucXCWOlSYO5bnyUuSeith3JqlwVHGqNmZ
X-Gm-Gg: ATEYQzyZBVYWThDecxFIxcwaqFMO0/ZZoymbZ/afctnMSdaOPTektvrLpYB07x4eV0p
	LHSOYlLxffXYIZwrXjcQFMFzhCh+OJgUgLDMKxGErLMZMH/RlQwB08Q2TW+d/DlXjaj0/XQc47P
	oK1w7nOEnwv6WVh4UZBYZa0S5SzopNI7JO27Qe7PvSFfvIbCT6T7bI/YWpsCxbobM+giCBfHuIA
	FbIAk2TQDBNl3w8R/jrtKMZF75iJY4UYnzajVZ7LRAQJ/KOChgyPSDhwP8xtOJPljvtYzfBQ3Oe
	oFO3XsDcH7AZ7V0I+EH6oADhcS/r8JKDzEm/5nkTGtHo99V5IU0gj7lXwrDqIEhHkgSsztmXua9
	+ghssQbwaYec4p3RTYHyC3wb0F2ToLlnM5ySmTTylyYX3FBuui4FYrwIQqemplxHWfiN4pheowR
	27Nzg+utSDQsV5UjzQ
X-Received: by 2002:a17:902:db09:b0:2ae:5a58:ec35 with SMTP id d9443c01a7336-2ae82532c8emr9834925ad.53.1772767369744;
        Thu, 05 Mar 2026 19:22:49 -0800 (PST)
X-Received: by 2002:a17:902:db09:b0:2ae:5a58:ec35 with SMTP id d9443c01a7336-2ae82532c8emr9834695ad.53.1772767369244;
        Thu, 05 Mar 2026 19:22:49 -0800 (PST)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840aefbdsm2230065ad.82.2026.03.05.19.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 19:22:48 -0800 (PST)
Message-ID: <4fe25722-9ddf-4a64-84ef-441e0a965597@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:22:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] arm64: dts: qcom: kaanapali: Add more features
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P7FCMjDNd1psZpu1HBM6sILC8kBPml4M
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aa488a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vqzCb2Pq2y2ruS5fAxYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAzMCBTYWx0ZWRfX53VnbZRbPQQ1
 nwe9oXVZdpRh9j2FOJSsX2pMQ6oDyrf3VK9rr8QEBGjk1qcJHEcy9vZNvdHN/pxmXkLPqSI1KMG
 hkZv+aoCzoqmUNjudWX9L50kbFHfsiIuAvp+i7jPOgt8m3dLEShNx8bB5U81k7NITAvBr1UCinI
 P1cxHRQad8UmOzD1GoIVAe9v+DJ2qB1RDxqHxliiUb/HEGUWsUT/484Lhcswg94KpvwJRD+6hwW
 9zfiKcBFl+ixaq3fNYViJ2zwQt6ke3aWfxDVW79f382tbwMJWVhnvafQtRi4H+0m6Hd0ifSeGKe
 VOivv1g8AvhDkbgIOozCHSufjgkDVvwTbQjZs1xtmOVRAtjGH+7EZaJnEsepB2+S7ZlP6RlT2Qn
 eqPak84RC6f8k5FuG/wvcQR21Pr7NaL4Lnrd2D0H5TOTpI6OTC3CN6n/ItH4BorcOjtfB67bbDK
 CCLpzTEuvp2TsmSo+YQ==
X-Proofpoint-GUID: P7FCMjDNd1psZpu1HBM6sILC8kBPml4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060030
X-Rspamd-Queue-Id: 1C7A621B0B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95706-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/25/2026 3:19 PM, Jingyi Wang wrote:
> Add new features on the Kaanapali Platform including:
> 
> - TSENS and thermal zones
> - CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
> - QUPv3 serial engine
> - ADSP and CDSP with fastrpc and smp2p
> - Audio(enabled on MTP only)
> - Multimedia clock including display/video/camera/gpu
> 
> binding dependency:
> - adsp/cdsp: https://lore.kernel.org/r/20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com/ - reviewed
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v6:
> - rebase deconfig patch
> - fix audio node order
> - Link to v5: https://lore.kernel.org/all/20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com
> 
> Changes in v5:
> - fix audio node order and cambistmclkcc reg length
> - add reviewed-by tag
> - Link to v4: https://lore.kernel.org/r/20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com
> 
> Changes in v4:
> - Add hot trip at 120C for thermal zones
> - Drop smp2p-modem node
> - Some codestyle fixup
> - Link to v3: https://lore.kernel.org/r/20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com
> 
> Changes in v3:
> - seperate patch in function
> - pick remoteproc/audio/MM clk patch
> - Link to v2: https://lore.kernel.org/r/20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com
> 
> Changes in v2:
> - picked latest coresight patch form: https://lore.kernel.org/all/20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com/
> - Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com
> 
> ---
> Jie Gan (1):
>        arm64: dts: qcom: kaanapali: add coresight nodes
> 
> Jingyi Wang (3):
>        arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
>        arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
>        arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP
> 
> Jyothi Kumar Seerapu (1):
>        arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines
> 
> Manaf Meethalavalappu Pallikunhi (1):
>        arm64: dts: qcom: kaanapali: Add TSENS and thermal zones
> 
> Prasad Kumpatla (2):
>        arm64: dts: qcom: kaanapali: Add support for audio
>        arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)
> 
> Taniya Das (2):
>        arm64: dts: qcom: kaanapali: Add support for MM clock controllers for Kaanapali
>        arm64: defconfig: Enable Kaanapali clock controllers
> 
>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  240 ++
>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |   14 +
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 5119 ++++++++++++++++++++++++++++
>   arch/arm64/configs/defconfig               |    4 +
>   4 files changed, 5377 insertions(+)
> ---
> base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
> change-id: 20260224-knp-dts-misc-fd2eee5224da
> prerequisite-message-id: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
> prerequisite-patch-id: afd581c1ad048b1b9d5cb13cc667a5efbdfd1bad
> prerequisite-patch-id: 554f737dd82cedf873d73db34d735c95c28b9cd3
> 
> Best regards,

Hi Bjorn,

The whole series has been reviewed and the dependency are clean, gentle ping for
the patch apply

Thanks,
Jingyi


