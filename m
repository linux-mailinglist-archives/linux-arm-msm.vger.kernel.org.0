Return-Path: <linux-arm-msm+bounces-99593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJSHKHhdwml5cAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:46:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74E305D7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B758305DA40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CC8202997;
	Tue, 24 Mar 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ya4/iyvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6DW52jb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8CC2367DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345235; cv=none; b=hZlgD1tZo6E9TTdlDhJlLASu8M4R0MdRs2Nh/An66VD+vmwq0g4bq7kSOAEQbu9a1CMWcgs67qDu+nGKi9YcAkNxdYRLq/YJonmzMWn5FGmt6j1FYm2OJurxwjE50eFBKhSgNcaaPZo4DlOCdV27pkY+ToqLD1QaL4jPsX5IPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345235; c=relaxed/simple;
	bh=65+84FKK55nWe7pFtqs85t3HhlQue1yLXCBU5vFyvII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD2ksGTiBaqp0u3CH2aqX/cci1pOr+9aC77xOQOjUU0G3E02BXL2t8xMgbAppeOQqQ90I4Ckmm0YUAs9O6vinYAAR4kc3SNVegtIeC8yoc4WQuBfd5w3ugmG9NTHmVIhBwF5drS2gGGTM9uajuddOEFEtry2F4OZ4ywgJxnFIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ya4/iyvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6DW52jb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3eD9A1761785
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKZ/0jdHWPOzXjhGz03vG7vP8pzgEzFlOIlA4ymjKmE=; b=Ya4/iyvfq4eqdjgA
	K+AQq+gbsXd9/wQZy/yYI+qU0P2v7HC3+7OLjWxVqvZTUM50aOySZydTbpOCjhmR
	elWiWERKOGDdKlrmxy43Mo5DNc/v89xD2A2d0acvEYKddfaCczYXCL9PEJ0J4qPY
	80GXkbPFdoKhsdbjNmy1H4QNprNND0iNbmi4/qdZXZAP6r5n1V402Cey2ofGvnAi
	30IGp7PjXQY1TIwJdX0yDwky8L47zzv/cWCp0F+Z+nCVVhllbwb7M3y7ZY778tJN
	aDKJzoMbl7+aWpTuNzmy79zCz/x5yjVzgaD2pOvBGbSzZeps90OPxDwfkljvO/R6
	/jClZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0buv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:40:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4f6c45a7so32787596d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345232; x=1774950032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKZ/0jdHWPOzXjhGz03vG7vP8pzgEzFlOIlA4ymjKmE=;
        b=G6DW52jbXz994xP4onNoMOio9wbJZsxdV+qQSozrUWaup06hSJA7kbNt13pVeNfvQ2
         VdWw+OkoDcui4lK/AiJVQtcW1EFE/eAyxKe2sKLvj3lN1D+u5XPxNFF4TJcqM9HjNqjy
         dSJLf+LjdwO3r9Z4mumsrwqVSuHPcMTdNRMwTfy8NPYnABTwbcN+A4j+KbWtcqPgQ7AE
         T2AI6qqWZqD/Al+x3JwZB0aye8U0eEhHvUYKTuP3Fw9/ChKpzKVVu2VV4G8TCgxcsx1D
         p/BxQV0KoqwpncbZs4En6+HU0hCk1vBs3toNlse47EZQD/s0/ZZSknFlosYb0tbzbsmV
         6HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345232; x=1774950032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKZ/0jdHWPOzXjhGz03vG7vP8pzgEzFlOIlA4ymjKmE=;
        b=KHxG7ay1FcYOV5L+EO9QpjRrUGxNqepn+Ze16SuExzO9SOqMFcww1MVBHEEU9oggJf
         QjmmE7U9NQgnXl2Kig/+n0jVlcnbgr4v1Sy+i7UQDW9c4KK9lTl+hTmKeiP5qrL643RJ
         Fr2NHYlhqJ83QSbZFZNXH/mVcPFK/Hb+D+94o6gPvHoM6xBTxm+KMTe46JybVgbVI7Rr
         D6GFtObDPSWOcgpBHGbqMa9QIjj4su3KTee48zulwR3p4XRtYAMgdaIu6vj99FbZPlj1
         6L+qq77vXO5NcA60x05UIuh6D6P9zF132JYWwvi01sq8aVdHcu1nWJxgoxx2t2FgwQgC
         DO8g==
X-Gm-Message-State: AOJu0YwF/jMYnNhoOTyrJ6c36hVeyFSLJq5Kd0ShNbUkJQ0yGfZ0zpBy
	37TWsPuL9VJO9ePbZ5hisOMIk3hc6aWH6y4c4V6YtkQVbJSmwNp9DU+vi1Nkla1WKa7aMUUNmNq
	AUp/qWwg5L3QOq6os9a8UuW7UUlRarLhn3h77/4PiFQNgp+eBqh3tDlwfBLswz1+wjPK3
X-Gm-Gg: ATEYQzzCvOtXKK/TF7XG8MWpMCM9Tx7+Vzi3EkyLO7Jti833edyoOdVU58wqbqParf4
	25YeAjYsHJIvWiy5T5Ugcdg0zrJMvnRkXWT5OvNLaOJnzg7VF6dZGrEmprhS99M1wSZjuy/KsQj
	JOCfXIH06e8c3J6gJhfTn58Iz6BI1O7POq8+ezxey9VmmxJiSnz+Y+pFp3kCA8+WcmnG/SIwMw8
	/bGYlYFjzX5EDdZPN4Tn/Y8vQm5AjI2cwH2ti6ArtyiNb0BtJ7n9gLVN7rI+bZ317ShoaFX8dQO
	YBKL+dORcvElA1Hc5pIkCZXU0TfzoLY9YVzqGpD70RdfreTjwaZRE70dPGISNtSRqBEfe6odtxO
	msAIO28Zj0jo5bDrS84+CWq4xmslLiBxrI+V9WUeAvv+nUkGCpXQFmE10NTM48D1CZiBtw6ngQ4
	3weV8=
X-Received: by 2002:ad4:5968:0:b0:89a:4994:fa01 with SMTP id 6a1803df08f44-89c859b9d95mr194750106d6.2.1774345232451;
        Tue, 24 Mar 2026 02:40:32 -0700 (PDT)
X-Received: by 2002:ad4:5968:0:b0:89a:4994:fa01 with SMTP id 6a1803df08f44-89c859b9d95mr194749886d6.2.1774345232026;
        Tue, 24 Mar 2026 02:40:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c16csm615966566b.16.2026.03.24.02.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:40:30 -0700 (PDT)
Message-ID: <351c4550-ebde-44e0-aa55-6405f248bef9@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:40:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] ARM: dts: qcom: msm8974: Drop RPM bus clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-9-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-9-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c25c11 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YlbZtE3MOUeJh5SSYQYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: j32vDDIX-4Y5TyXUW4dGaSZ_OQA9rBEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfXwQ4E+7NLU6Sr
 uca91/fgRDjyqluA3IJ+P9J7DTTebEogKfFFDSnBd9fOml0IUIEnh1wyPjn0m1UI+5CVhNjkN06
 KhtMXcv9/arLfHeFlgI85sv7Lb5AEjSsShEzEn2qjzxbBawMiH3+wp20XgBsPj1lkQCi1PjsdWS
 scEjo4XxqzZY2cy6bNmGgaYvG342zrJr9QjpRM+GyytkMA+6i4XPg/Mu6Y7Nm87QUOeRX23DwxJ
 EpAvIlnS4/uJKQnmMrJfPS6AQx7OR8rzp/2P+SL1BbL8mKoUMJqnCAYfLG2EHGYCt5QN5FLL3pV
 uq7tSKJU4oTnMPisv/nFini5htrIknbjaiZWB5WgbTTsZujEYOxywmvEDc4AqSP/N8UWwTp/ePu
 wZ93TCEk2aDPhMWcjufEVS0JRz4dpA0RKAQ/kw/7p2iv3OWyHE2s+Ajw+wlsAS/jCs0SFoyfnjE
 j8PoD4r3dWBFulcgySw==
X-Proofpoint-GUID: j32vDDIX-4Y5TyXUW4dGaSZ_OQA9rBEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99593-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D74E305D7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 1:10 AM, Dmitry Baryshkov wrote:
> Some nodes are abusingly referencing some of the internal bus clocks,
> that were recently removed in Linux (because the original implementation
> did not make much sense), managing them as if they were the only devices
> on an NoC bus.
> 
> These clocks are now handled from within the icc framework and are
> no longer registered from within the CCF. Remove them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

