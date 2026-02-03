Return-Path: <linux-arm-msm+bounces-91655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCznBH/OgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:31:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC7D7B01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B61430DC30A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5E0320CBE;
	Tue,  3 Feb 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA7ac40v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjR5ZgIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5F31B107
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114462; cv=none; b=rIJxKParoaA6sk+juZwmyAg+Xunr8IG6nB0nokajMiqox6tFOeWZHJ9TV9U8VfNEqV/UpKHgY7ERRJsdayMFB3OnNBqv0CrTsjklIMdNpgl3EYwpq9d5Hcz7/VX6u+8k0oRmuZfvM5HQPA7LxHFVvZ7gaVhnxA/s76aJwD26MpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114462; c=relaxed/simple;
	bh=sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H73S+uJ/gRBzejmFED7yEnz1wQyW3+vVxS8E8hPeyYxV0Tvops4J+uLqopp6JT5sqkVmfqkc55ey/INXJwUODyI3i+CXE7FWQyQ2Y2GPQYfSbrNOap410AjpjJTkr7jSp1UiQ1pYgqLrnNTZEVn//pPXr5IH4WqnFwVex8Nrhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA7ac40v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjR5ZgIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137PIG01320079
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=; b=YA7ac40vZKveVnC0
	JIeKvKXMspHqquNAprDigZnWcQORD+nis84IpXb3tln0YfPA/Q7wpxLwmDA+mh1v
	8ZcmptC5NRwa0RKwoc/Lb5uo42p1IsFz11Fp40EzljsHCqzlqP68W+4A5G7J2OeW
	rdZJT8DjnxmId0wgXKyYNqXfN02d5FoPOfNDPRCoAxaPBdSrSK5H7pVDLFJF3+DE
	zJdZWD2L6rCYlKZNxO8c8OtzVRYzBWOqngwAaSnOgOwyal5oKkGaUV9Pjpj14TyS
	7fZKHG5bhlvOICGXYniKfqBAzEXT2EO2VTaRUuhOBGxFMC/LUG13te2QDrHvFsfJ
	HD4AUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3cm70jx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so86344385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114458; x=1770719258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=;
        b=SjR5ZgIYrY0hvlAXpI3nd6sW03dbAuQzOD/pevxv1IGp05mSiWb098mGvc9cbkH6rJ
         MByXCPTGNCrZQtsMehGeS5I9CwrZB2G9GOBYf1L87K3Ju2ocx7+516GatxYemEdDk3U+
         F6KTRDrlIWsftcZbOLdt6PV1Dh5lfXE/ejIWqBu2jIbzv9KzqnPzjq50BwYZBgh0YCga
         TOF+0SoBwYXjEcOQxlWlSfPweJFBirZPqqtRK+bSD6qvUqSlfCHAJLLFfMyU5sVHsUUm
         04yQgK5KYCKBBI+o3ln/E5SlbxrIKvjdyYH6GNeZNmIzNFgohu2MWlOcl9YCvva/TNmY
         4ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114458; x=1770719258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=;
        b=Hstnjd30hRKRoa5qeD1jl9joqGWfoUsIsUHpIwNHse1DStmgFr1GNfJnTAtCdl3yII
         LTh+zW6Jl0Yv3sHzpXBkHgrX1bPxiBQqU+/OgP2x4QghgNCEQzRIC1gfDK75W5XlGiSG
         uEVIwt8RLPpUFuK9HHYyMAlryd5NefZJDdiErHDzD9xr8YcirQrgzhGD3Q+ewRIOuFOl
         /VLQ2YGlXgFiw3rfMyw2zUOujyAdu9mTUXbMDbguMjIHNIvQPc6VTxB0Xwwr9rIWAp3a
         yd49jlP/2TR4WQ+x6XwBDtER9Tz4lCkJ8cyxmayYAJK5+26VH8bgwUwuodwhSlcJ5ulx
         EMJw==
X-Gm-Message-State: AOJu0YwaO3FsLKnSfM4BIALQ5pvydPy+vuM4xKlN1BYtRa3SBrdpbFa6
	IzmF5pm9utT0XYn+U2KoPATtPa5VaEFlyvXicu6iz7H58Sc36gb0plOm3grJGtwFeaQoQdW46Fx
	ChDClyYTJSgikNMPNya0q+7Blc748CFmOXAVAgJVk79XjNJ4sMwysVa9nAc3kqumpdDW4
X-Gm-Gg: AZuq6aLpiMgwM7cqVfD9Uc2XXB0FrxVBOTJbrWZiW4BgudtpQrt1Ia4rg6aT58Fg6fd
	RDE5Y47zJ7V1CzC1Hva1WRcu6GZG4aJHxrA7Wm5i3DRrVFkCFHhETSkCvf0A+0ZKdP1tSNSiKYf
	va3UNjPJ4/XpcirVmeu6uMh/idsJ+CdhdbUdEN0hvfytf1f/MMhR12EPXM9jlNWR3zBdwQMN3gs
	Acq/x5ZXObxRU9tQgQ+EoYywswy7zTdk67aSVGSPYvxbW/xG0R8jSdBoUoYEUaZLw0x+oKnwj7I
	OT1S1fOIBeOyuqjN9hyAQ4kxO5oYMHQfAU74Mid373zkfbFTMXYISUsl3/zgufgY6uXH9iEv/bV
	1fz68MZft5ieAgW1mdXfGM/y1HIVTaQBO8jg8vCxViaoDEbR4PG7cqOVCI4cnhUjlAvU=
X-Received: by 2002:a05:620a:a91:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8c9ec71b47emr1064471185a.0.1770114458343;
        Tue, 03 Feb 2026 02:27:38 -0800 (PST)
X-Received: by 2002:a05:620a:a91:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8c9ec71b47emr1064470685a.0.1770114457996;
        Tue, 03 Feb 2026 02:27:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b44530bbsm8663460a12.13.2026.02.03.02.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:27:36 -0800 (PST)
Message-ID: <c94f5bd9-07a5-494f-9924-cdc14eb3033d@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:27:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] remoteproc: qcom_q6v5_mss: Add MSM8917
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-5-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-5-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX8iystHh6kwUh
 AVe+8p7f3+dqGToeXyR1QB0QZ2GUIgu1PHP0TuzjDrNs6Qgse5I/foRkyeuq8E+e7U9PY20ffG/
 UlH7TgwiE82fhEJEaXcAgbEkJGWMfBWVX/Ey7Rm3Be+kVYW6xT5vuLcr5NJFqg2eFvyNvkoP+GK
 timZ/rGywfUSvxitSgHZQvtL+c6U1HV9901/vOge9WO8J/X1yv/sQHObcOI8cBNlQBNQ4AJV2pe
 k/ZLGT9i3cQ3QGfC3jkkf0S6WxCuyduRb0PWf5QtygEgOFdF3rQ6Z8Vpnyv4pmRMbDvmNsmOGYu
 g6+XEWzvPu2lO6B0ntKsiiVneeDo3yfWOMNOtr2lx824SZlpdBO0D6c3ZTWWfU/ClMkolZ4POwy
 K43pfWvGS7iiymdDsNICxwiUgE+w5D4Z2oejQYqcLcd2Dle1c1wdFL/nA27vS12TQ+UtMJksGOQ
 o2DNYQ+uHBgjD2e5W7Q==
X-Proofpoint-ORIG-GUID: Pav-nwzkbv9WRSobTBvV1SRqYJeEzyZK
X-Authority-Analysis: v=2.4 cv=L4sQguT8 c=1 sm=1 tr=0 ts=6981cd9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QzJuLQPmYQVcmAZsAwQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Pav-nwzkbv9WRSobTBvV1SRqYJeEzyZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91655-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7DC7D7B01
X-Rspamd-Action: no action

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> Add support for MSM8917 MSS it is similar for MDM9607 MSS
> only difference is the mss supply.

Pity that we need to encode a whole separate config data struct
but it is what it is

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

