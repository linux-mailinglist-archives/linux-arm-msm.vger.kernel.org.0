Return-Path: <linux-arm-msm+bounces-92453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKMWECv7imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:32:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EC118E79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC805300A5B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F4A341065;
	Tue, 10 Feb 2026 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdUDAqZa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V925xCqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D8340280
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715943; cv=none; b=Zhaue5ia5y0BmblFgfGDpO2APuwU+wSedCN9GKyQgfgPYZD9psflunim5fA66LO6qYokTwEiylR4ofbRnXPXShKvyJ1YcwIy29ryPI559DvL0TA7U9LQu5u5AbXautsMGIrAISuzMThsmCb1P6mctAEjOHpGLwbNH2WFMgRaRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715943; c=relaxed/simple;
	bh=fmc7AiyBkTqnaea8LVR0pJCHhVnmR0CdWnSQqss2KiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTiXHh64NlyyKKljYVRzwVGfrsFIeMQ+kd8XkA4az5vWOQADdtmLj5r6gKb3CCUTaqJlLkRceRx/SS/C1bqMzc8ZzQ+fheQWJoaSuO517I621JecAhI3r9lx+t2FcAswI4+S4V2QGLGmiqY9Jx3FzvGAvva8JJYdkgTd2fwmTwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdUDAqZa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V925xCqL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Rc991419571
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0odEq89IVS+nnV/Xemci8oKH5h9bGTzCaaca+V1t7E=; b=KdUDAqZahMHQY2rW
	CevKoLyzXcKoXP7sE6rtiw5lQlB4g3U+7u3RL04UYt6luj9aNLMzw3fXJw8jFUSq
	Lo0HA/bOAhHZaE0QFQH94ugIFUAV1sAE19XYq1lv817PmBe345DMe9lBOtVRZ1ZS
	cFSW0qbABf65bsAB9g7VTu/GIbs1fx6nFjHAgOYkZyIXkKCH0r0Gs+Zn/rHwnIIN
	Qha5Xw4U9ntEO2Rel/rzkciV+FdbMrSuNiCzIlSX++E42YBa0NUtIS44ALkKJ9zk
	zI1QKVJwnrpQ+bqemIVlKJhnuTUDUaDknEAan1KkWe6vNMJah9p81OHhvGsao53w
	6a79qA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvswbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:32:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a182d4e1so95743885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715940; x=1771320740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0odEq89IVS+nnV/Xemci8oKH5h9bGTzCaaca+V1t7E=;
        b=V925xCqLPpDB8EGkDqFK0OnmBkF2+hV2+M9iszZmU+mFx5N9N45ISvy8c9E+hTkt7Q
         ngBuov/rgrpnI7El+/2OvgRngrKSDmv+h4YuvDmmSzcwD0208O9vsVyrKWaIhJWx0TlC
         InYSEL7plgfxcco1sU6KPW1t/e/fZmA74AwVtcrIQBHB3BV3az8yHEyBlaLVBDomxOmm
         zHV5cwBT1g/+vkLvrRGocTZPKpl4U4YH+QRMzEBKASuG3t9HDc0cZfoa5dInixtdyqKn
         iv1Nxh2M7CUxItUpvl1RsTETvbo7vLfgYzzbpfr+7Cz08GNimOzVsodpKeO1eNRGEnm8
         SXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715940; x=1771320740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0odEq89IVS+nnV/Xemci8oKH5h9bGTzCaaca+V1t7E=;
        b=k9fAK/eEHllyAvWwGipz6hjTS9XLuCYBWyx4NV8eWeUORyJ2hydlpdKQPJKT07eiuI
         H1Ur7fIz7m86sE0EiOOnigyZtH5jassFNSJDY57CdumkUPlEAQFzFupr+P3CWRqObDYv
         95fHHgAnUyQ/8vzPVtvFbwX4YnDweMNKztdS8IO0US071U2GQ1TvLLcZXHrnFbWsklOM
         VHKdMdofWsSoHUDLLb5cnVJuaYj2AUTgdA2tbpjscd9Twlop+nPjMY9MuRv1AL497klC
         b2mWqv0wtrd61RVZ8ztocivhJxtNuVU+EhFm3qqyXTA9SPAZTebm214vP+x2tI1UaMZO
         vqYA==
X-Gm-Message-State: AOJu0YxShf9bDuNTrAl5EmBxxRyE/jaiuCa2oCTokpQCl9xGDetUbqjo
	moDCje+t9MTjB2Fqtd9dEQUsEzVRmt9DV/ExGyJlCWaXzxzUsYJGO8vyIsHYHcsPu/m8JvA5y0d
	w4HriBpMFFYFvJlAbt3zKV/Gb3ePeHY8yHtalq8CbDtYFLvNj9n4q8Cnd9jKwhijy1gew
X-Gm-Gg: AZuq6aKcaxjtl1SABFJfAFeFQBVWptLGNY8VI39Fj+gl3am3C+yi41ZG4aqqkO9CcuE
	fjLxhOcFZyKZFY34MU4aQdAoBM3LB1oVjC7cMH/erL8M9PKl8KjYvURXw1Gc3ouOzxBoPuVG75U
	+Fp8SDKiEsf3BQ4uCDYxkBBKrh5DFmkpGjxOczMnHzg3kCjIr2w1rHcarxh+N1G4kQe+dIthPLh
	IPhpbxEidA7PGF0sVtphFlkkKKvmOj+yq8NLhpsAh6UQpWkCqu5pF+43PpIXx6A0uY6Ehp6AXgF
	VL4ZPJF7xlreTYbq6T8cTAY1zE1Y40L40mRh5gyjiz66zy5/1YO8F2Ma2nPuk3wOwvE/IxVFah9
	2KfcV6WEPanvTjEYFBjYPr7eH4fc4dqfwj+tZS5XCJlr+xCjmosUXDC4t94/iLN/tWWZQNX6W9d
	2bS7Y=
X-Received: by 2002:a05:620a:468d:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb1fef263cmr106554985a.5.1770715940401;
        Tue, 10 Feb 2026 01:32:20 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb1fef263cmr106553285a.5.1770715939925;
        Tue, 10 Feb 2026 01:32:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18d0sm490923266b.40.2026.02.10.01.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:32:19 -0800 (PST)
Message-ID: <32314fd0-3d15-49eb-a0f2-d029728d8d00@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:32:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-2-9c1ab5d6502c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-2-9c1ab5d6502c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OSBTYWx0ZWRfXzqiymLOoJllZ
 uOQmLSLNT1hmJ3D3yDgADYAzrUAQMIf1PRG2PNgiHjx56QbSqimjAYgmmblyigmb0p+h1fpoO9L
 LkRYN+w21+MFTAUqjYxdNLvR7jNvj0ZTPPeY5dREhJir3aUZryQ0E8iZ5CcbMJQUHkAUC9Nlu5x
 YRpqmosDqj9TU2uECyOHEGQSJ3QZ6zA4cASXSG2zqqKdEmP+Pzza//UMGAPEP1BnFCiNHeJ/UUR
 mXXS6d7wz+WvL/lLFWjApmw1dhfBphw5uMYW95ER5DVTpNcxyt5qKHkpw8yl7Y29fDpncen9Sdd
 aA8m2iEHreO+H74RCoEZuRDzbs7+8KQCKHUs+HCM1SZSR+7PM3jTPGlbivttc4VR8U07tGwNlys
 YnlC99oU5eZezUwrdLyh6aC3w8hOgDC5jO9i56/v1FyhezlATIhn6WxQW2GzzLTLLV5VPRyaKvR
 Y452M98ZY248rpLnPlg==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698afb24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=AC2hTCgHVLFjDka4hzMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Xcw48MXxxb7daB6OQCG9cu98HEwuV0zM
X-Proofpoint-GUID: Xcw48MXxxb7daB6OQCG9cu98HEwuV0zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92453-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 639EC118E79
X-Rspamd-Action: no action

On 2/10/26 7:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not available or
> "qcom,ice" property is not found in DT. But this confuses the clients since
> NULL doesn't convey the reason for failure. So return proper error codes
> instead of NULL.
> 
> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

