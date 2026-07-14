Return-Path: <linux-arm-msm+bounces-118919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oYaCMiHCVWr0sQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:59:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CFE750F35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:59:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jhgTw6cl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PPAImNPg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88EE03034BED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF7B2E542C;
	Tue, 14 Jul 2026 04:59:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976352DD5F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005148; cv=none; b=i7+57D7TOcX36sVEPBuWOmvxlmvSD4cjd2tshwWti/xb+XxEgAZ1gRZwuudk9Q8M2/3s+FYC1Em3hwRGTxrSPQ0Cl9/75IPukYMDXZ6KSH/NVOo8E/AU4VeaumTNSjmuWn6yPU9gArkbOp+ID+QLDvaCxgWBsSS3WqWcCJCR404=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005148; c=relaxed/simple;
	bh=uTbwqyIxqUuo7FJSAFS6UCtZV8KF9JsL6sBFUuQtLe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6+pOWvnuKlZCL6d/rcYY7wZd1AOLMwn7mG5G3tYm2aF/DY2wFkVruP8lGl5ZqBVUTjFUMThHEJrFGuOpKdhBFlmtEPhMcPIh68LlT7DfdYIcZq+qLfwGPG3E3DpRDYNwXCABKOBd7KpIbaDqdRM548Qekybdzjxdph/pMVqAQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhgTw6cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPAImNPg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38WF83483240
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	050M84tU4fgUIaCQsDFK/sQz5gKmoa8WZe7SdknJi4U=; b=jhgTw6cll4zOa432
	wjJvtawrH6XKb8wVpMrUpxfXo+4Eca5gX7xcfmpHk7o4ikiK2/HvG5h2Ye70GoVz
	pQ2HIRyRHJTl1jB3HiEzVkqPeji1d8DZEHqW1SBcL1Tg6GZ58Ktd0qJMI/oilQnA
	DFGAA/pLoTulzATVHfhubGFyoyU0c9JlE9FRkXUDXLqzl8Pm5Qv3+q4IHy9go89L
	WcaEuQwgpEjhkPP0EcXsL2FxQtbiNI3kTjyyVRuxKQcwiloLBn8QNtxWJQjBaycP
	+kgRzPZytX1e13GPf2oQMED7SsihwVZNZvaMIXxuMyS5J455ntQyukkzdT9AxD/i
	NY/p8A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xa9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso582335a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005146; x=1784609946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=050M84tU4fgUIaCQsDFK/sQz5gKmoa8WZe7SdknJi4U=;
        b=PPAImNPg3TzUJ7N1p4ltCHeU4iso2AEVng/R0LjMYI+6O9FkEmxg8zeTr3+8wAI9wI
         kK6/1H+F3GJICRLpvaoJXn6+5Q78x+oPi2vjZIPSPOckyrnMTO2IFXcIZ5qojFtkrwt7
         CmRNKctruX5xltW4yTsYchR0FacRM7dRF2Bg6qFCubG6+HLLH4N2ETYxi4WEMkIsSKlJ
         +/jAeTCXIaWWUzvFiF+Qjpt9hQUe7/aEWkLhK4Ibm54Onk1WTPQdnQmujuqJoYZNAkvK
         JjijMguxKh+3wM2g12AYHPDe3gRXhMZy9W2G/IYbO/pTzRbqHgPqNkDw0LWWTmCFsCZF
         lVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005146; x=1784609946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=050M84tU4fgUIaCQsDFK/sQz5gKmoa8WZe7SdknJi4U=;
        b=DRcJ97fFQfS63xnwnygGIO3oh1vFZUVPO5Q/mhgmuyZE/FTdh1m0qGRcNjXCVXyFC2
         QsKHzvWPzd1wVohsRQP1q2QqRMaOxCF/+LuHtHaiJFqLJM2qU774OpuQRye/79pomg2S
         31Jjc8RpdWgKUolWc3FR4jqZUHezP3ZZAO1BOvMVx330kPy9kAr+Cr5l/tbZ5cv+DI5P
         ZwODm85ODRRuSuGHVq5wt3msAGyAAVCs3Z967cFpmy/LUtYXMNwXjihzzUZ0ZFAXQfjM
         2AtenjqHf5hZh1STa6hr3ikSPWLKRDvjFPu9q12o7C7w9b+HfEMrUtFY0XtJQlYH642j
         ZVxA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa/X3nolyDORqpDJYOPjC03exa6IRdUzoV6RMRh6er2d4XqlSQrbyiRORKnrQ44o4qGgb7Fbwh6d5NSdNu@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwsgJBANhXeeR7TM7P9AV+vbLThu/BDePAEw+6jKSA1ZiKFY0
	zsq1dEXfNrU9UlhTB4MyYklYt+199AlgH5v4xPM5X0l6t3Epj+3fI59KF9iYyrmYEY/hWZh2bK+
	It8mU6nPfnJXRCBZLiIdN8BO8WLxIqArD5oZSnwh1ALHKcQEt9nlmKcSbV9x6KGM9dzp9
X-Gm-Gg: AfdE7ck1iM+F0rJdMz52a3pIa0q1i8+RMGUBN03UD9uDA7lECtHr853MNYBrNPqQgt2
	vqn1+1cH8PvTEYO0K/cSzW5ELibftGMKI0gEAcR+lV2Q57XnFZnF6mWE3qje+xaR/dKuNEKjQV3
	XywyNKgR5Q54TFWbyN199dZrv0JMFrdFbTvqpmAZntkcr7l7Bn4oJLc5ww2uMcMhsjebmNnV5J+
	Ww9sgb/pGJtSB1pBYnezv512jYbv2h347pqecf6bweRdB49/somTYFjadX/JxEWHVhJ3wLsYwba
	CasyYI5gGyITJBDoRxBYtHbdQ0cwnkw6nHQ5mm+xFre5axgySexHxFcijOLQw0jydhCeMj40kHb
	mT/1Mi/BEeFYYwjlMW8DPYJCf9yYV+Bh8w37AoLc=
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13333741637.41.1784005146217;
        Mon, 13 Jul 2026 21:59:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13333701637.41.1784005145795;
        Mon, 13 Jul 2026 21:59:05 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm81953564eec.19.2026.07.13.21.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 21:59:05 -0700 (PDT)
Message-ID: <3d195500-96b7-4ce0-a6d2-b8cd3a183168@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:28:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add support for Camera
 Clock Controller for Nord
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>
 <20260708-mindful-alchemical-loris-5b6b3e@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260708-mindful-alchemical-loris-5b6b3e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfXyNbzVgcARYrj
 yAkReEW6yZJ24xPMxJVyulDbKBXTnA07PVxDea44nI6RSLTqCiNLrl0QRCVqTC4cTYwGoe/vzTW
 fto2fEOp0LxJ5eSeZMakiq+jBRgOTDTg1dCC421lASj8k7f6LZTVZhLVIs+5YfHxPl/t0qS7/VU
 6rvzG2xjQXWr3fevDtGLfvdZqCKtpziW8LuW2UCAsVZtii8VV8CSbqlVe7Hn4aJIJTP1Cm7h3Jw
 /3S18cee+qR2OKnZXTVTfSeH7DLs5obiLYK6JLI9DXgu1D2PdlSsLSJaKossMbOSSZXQiK3CO0i
 RFPWRW5W6tQbEztn8H0b0oXFAQXInf46qW8+cVVWZ5YaPZ0AGqjG/7gBt5xk5XRb/uo0QIlSVHX
 K8UsMJ5o7fYrP4rn/blRuTKvNBHBY9drMufmucZbPBuhNreUOqaJIR/z801oHNjClf2AV9bAh8m
 w3KziHR1PqMLvpjM2Ww==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55c21a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdgQeHLHCxk6-GMbiogA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bcOQlDFl8sIdwxrbAlZBIytHNNIKinCO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX45PCr1moQB5E
 yoFakeY8yxjHHGJIl4Sl4hPvcoVlSiW3sWMvM9sniSes9Fjr9shd/7iHcAywHxgP3i0WUmHV0g5
 viIbYcZuhnUN3284w0eNEXCxWr1HM4g=
X-Proofpoint-GUID: bcOQlDFl8sIdwxrbAlZBIytHNNIKinCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26CFE750F35



On 7/8/2026 2:11 PM, Krzysztof Kozlowski wrote:
>> +      - qcom,nord-camcc
>>        - qcom,sm8450-camcc
>>        - qcom,sm8475-camcc
>>        - qcom,sm8550-camcc
> Why aren't required-opps not required?

Yes, it is required, missed to add here. Thanks for your patch
https://lore.kernel.org/all/20260708-dt-bindings-camcc-required-opps-v1-2-ae0871774210@oss.qualcomm.com/
should now take care of the requirement.

-- 
Thanks,
Taniya Das


