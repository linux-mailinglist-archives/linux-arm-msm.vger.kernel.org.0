Return-Path: <linux-arm-msm+bounces-117910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wfp+Ly9cT2qifAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:30:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4FD72E4B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:30:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b5QQpBeM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P244gWBB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117910-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117910-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1D7430EC0E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA103F9A1B;
	Thu,  9 Jul 2026 08:23:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C54A3F9281
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:23:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585413; cv=none; b=CJRweOAIvP306gaBvy/5foW3quFSPCZgG7wzJfPwvpc5w2YiMR78mr2mECn29KMgBTh3ABmyPcqWewQacwkxtWqKS4jW2XvHcbVlYDmwCEluvKpKU8nLUa+11iMMNW/bjebq5aNwvC4yRSuyj5XmLuxWl23MW7dWzob3XM8og1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585413; c=relaxed/simple;
	bh=134ufy4mmxPCaUX9tTVJwnO59LWqPJlkTcKMtmq1QQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJxxEAt2Gfie3sOAV6dWxe7lVd8pQXg794dWN2EiJ9E4B8jwm1Jglle7oVfSeXu5oLnKTGJnHtqF15LE1Y8JZHcSAR5QZloLl4iC+h55P7aA1+Gs+uUWbaZKDlPSVmXXT66RrQErlzLPf21/yWqSWypbdr04r0l9HhJOU494oZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5QQpBeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P244gWBB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960FM4931920
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	em6hRThTjmpK+umvlO1H6MSd9jDxUbf1zD7dWYPZFpQ=; b=b5QQpBeM9t+6pFMc
	74J69gGJ5C6ePwsMhBgzHybMrF6+CZlYJeQCb+LIMdwOW89DvfzyKssSObFeTHZe
	iz9Pz36OJ2gW/iyD8sMnzXmXQKgZxmr1nDUuUUQIwy2qOqowYOl1dQGATRl8hFCn
	ECKAh8soYT2mLC6Crcs/ZvscSUVQiDgexHoXvKEjop5ov48ihHpLx0Tu7RLWFJXn
	kuzLy7Jgz8E3AXwo8HvHsaFDB/qX2tlYv1j+8cFXyUjRkbvHi/8qYJBz/fjITbMN
	B54rgKNi3NyLvsiKOFRISAcPd1CQbcpivJ/UM2ux/Kt/OPXLceeCH4c+AzN0z9Mq
	3ov5nA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsb63h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:23:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so6680661cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783585410; x=1784190210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=em6hRThTjmpK+umvlO1H6MSd9jDxUbf1zD7dWYPZFpQ=;
        b=P244gWBB764HE47V9w+Gg/OVyxc9vELrTUwxFtB21dfHTE/+INS+7cZWYXGmHQF13e
         HkW38Efj4wh2bsbaU/Ig2NRCEpXD0RxNTYrkY2LvRMa5X5lyCM4kYCH5u6EqK2Lj153I
         RN6kQGlL4Rezz2RuuutyTSPlynUXMVR8uAi9QUJSVqY1FEm1LnmQbVF5nev8mOyMUkgB
         f3h8msYZ0vc+kDRpXvjVXTvi+o0cRuF9tRmfiaRyrNzMBPL6WpLWmTqc3SU54Z3z+Eyj
         kdArRxhzvnZqMGcd3d/W33AKFwjhSj1Uups75X+DmK30+s9j//ksL+nrj1PHPZjLmEOS
         kLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585410; x=1784190210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=em6hRThTjmpK+umvlO1H6MSd9jDxUbf1zD7dWYPZFpQ=;
        b=ZJiSGUGL+AhPmdFvTMq1utFfK01lEPgApFdwUpTtZ/F32LTPJWHe0s+3d/sYzK7B8M
         vMgz4NtYDxpdvbNTanCR1D/4ucqAKvTpgsaalU9YkC6jSS7+bMr7ydGPRgdeWUFVnHgA
         kwtIkdxTlHcpQsFWphgtihSTeUvl+HGQrXaiuGuPZMaIhw2JBB5ASl8d2wyRSypdhktp
         +6NcR8vNxyIhv9DsxxlOSrSCQu5KTvN3wDjW4MIpMYREPhtp5MNvdafJwto5SeZkSZGh
         kd2/JBqmO9QwK6dEkysDbsdaQzUfee1rONHRF1s9+sZRGYPU5Hr5pFk9sS5B0+M89ayc
         AYVA==
X-Forwarded-Encrypted: i=1; AHgh+RrI4LkkMy0Ew+x2W0I9s5RYwuHeJ91iBqzsiJMvXuqZbDC6FM2juY1o+onxrOAEMYXdN981QjVqF7DS3Gcs@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/AwSCX+Sd1KM1ISnWl2qq0Trkjwb3TjacXgFbld9N/OX1oAG
	vpgWC4RE0lDj2BrdKjhzHnQ2BjoA2sRUS0sWEs5rd6233oGNxLtKO408eznsY0u1hy+QS71RPqE
	TxJH+hazgHcd8Oq/4K6LKHgAMrybfyNJN07v5NzTGDOwSom1jISQkzUE34RapNROyvT5y
X-Gm-Gg: AfdE7cmELdrm+0ggIbjE0e5VraJV1K0u9syKUhZs5YEPZOTjghiniuWhruui4E8jj+o
	r1IyYK8XebFWzwlItvlkP+Gjot+kzAD7F6nlsDDROaavwfyPF4Ck08FOM7X7AdPYwPcGf64sY8Z
	O65resmJHYoudsYYkqQIN14RLg6aIl+CP8g6M8rsvj4xGSDEtIkQiP/E7fbQ31PtBAFzUJPpPZz
	LxsqGQa+++JqJSiW3Qic5xdZNKIxnt5ISv2gonh7SyLzbfhunTj69fRsOo7Efw31VN+tA/fh1Ak
	Krp7ntSfywkD9oRMJk5Ga8fYC4pQRG/QS0a3xfCtAJEyh8hgwTqL9ufvwOYPjt9OlkzEWlQSk1g
	6TV32vwkEm3pBCHifyec+Ra7qLMfCoX8k6tJHB7lq/+EB
X-Received: by 2002:a05:622a:2282:b0:519:e91a:f4bb with SMTP id d75a77b69052e-51c8b2df9a9mr62944391cf.31.1783585409745;
        Thu, 09 Jul 2026 01:23:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2282:b0:519:e91a:f4bb with SMTP id d75a77b69052e-51c8b2df9a9mr62944101cf.31.1783585409169;
        Thu, 09 Jul 2026 01:23:29 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c1470325sm288040366b.14.2026.07.09.01.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:23:28 -0700 (PDT)
Message-ID: <3b9f1b3d-4c06-4006-82d5-d59ce2101070@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:23:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
 <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
 <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
 <54250163-678f-41e7-97d0-6596123367f1@oss.qualcomm.com>
 <d7dqqj3qctbqdani5frdwpooppo2sq5odru6s4hxoj6d42sihb@fad3nuhunazt>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <d7dqqj3qctbqdani5frdwpooppo2sq5odru6s4hxoj6d42sihb@fad3nuhunazt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3OSBTYWx0ZWRfX7HlLTNO7iVVs
 9vAcxGmjPCuoC/Q9EDgM8HgngHou2HdptYr34BGn82xvOUWZwkxyAlAfqkRvPCS2Z3wHOysjT0N
 FHYSwGOB3wzv+qDfcCYj7/doxwdDK8s=
X-Proofpoint-GUID: w0Tj4ktYZZms_ze6SpL_aoa3x8X8-Xnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3OSBTYWx0ZWRfX5dzOePa9mfaW
 RaNRdfDhvc6rVDjhJlIt9JoWG9bNb8fww6ocZZdBbvjGoTMXv5sMAnaLSlZevh2Nq+vUm8DxKGM
 MRlzoVW7Eq5YmOQ9aZz67XlanxyQtFZm3fMuEyYaLf8ed79S3xL/RJ3GhXbngGEBhv6WwotsQGn
 /6bfZVziW1E7iRhv6IIQkFjcjysrPF0kpeW3y5hAy6qLnKckZ2OxHdUZVlOBLDDtuibWhhSC7KI
 IgE56uUg4ohxLnpxxj+PIZyLGwOR2L+EpEMWWm0l2oadTAHez4nascN7isOv0drxSrI1uat1WJz
 9Q7ch2sZmoqZesKtf1ACF/ZR8bonRu7EM2tDpXPOhSWJaPin7Sk93cGREaZV+ucXfD/TcutEZV1
 /ZzFyECRioKDRqIr9A4eThAhAx0Kws883fRkg8iGbZc7aAiG8TO+M7arnAqEG6ohDNmTiVJtXX3
 wpgZSuyMigAtUzpiVzQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f5a82 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=ftX-3Su0G3PhC2htbk0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: w0Tj4ktYZZms_ze6SpL_aoa3x8X8-Xnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117910-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C4FD72E4B3



Le 09/07/2026 à 09:58, Dmitry Baryshkov a écrit :
> On Thu, Jul 09, 2026 at 09:42:04AM +0200, Daniel Lezcano wrote:
>>
>>
>> Le 09/07/2026 à 09:37, Dmitry Baryshkov a écrit :
>>> On Thu, Jul 09, 2026 at 10:54:26AM +0530, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>>>>>>>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>>>>>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          <&phandle device_id min_state max_state>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>>>>>>>> existing DT ABI.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> [ ... ]
>>>>>>>>
>>>>>>>>>>> Why are you using only those TMD devices?
>>>>>>>>>>>
>>>>>>>>>>>> More constants can be added as needed.
>>>>>>>>>>>
>>>>>>>>>>> Kodiak is one of the supported platforms.
>>>>>>>>>>
>>>>>>>>>> What would be the benefit of having more than thirteen cooling devices
>>>>>>>>>> declared in the thermal framework and having only a couple of them mapped in
>>>>>>>>>> a thermal zone ?
>>>>>>>>>>
>>>>>>>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>>>>>>>> need to add them ? Can we do that incrementally ?
>>>>>>>>>
>>>>>>>>> That's what I am trying to understand: why the implementation uses only
>>>>>>>>> the selected two devices, if the modem on Kodiak supports others. How
>>>>>>>>> can we find out, which TMDs to use on other devices.
>>>>>>>>
>>>>>>>> My understanding is that is an initial thermal setup. Gaurav will add them
>>>>>>>> step by step while setting up all the thermal zones instead of sending a big
>>>>>>>> patchset. And TBH, that will be much easier to review.
>>>>>>>
>>>>>>> In such a case it should be noted in the commit message and/or cover
>>>>>>> letter.
>>>>>>
>>>>>> Thanks for the review/guidance. Not all TMD endpoints are relevant for
>>>>>> kernel thermal zone binding — some like BCL and cold temperature are handled
>>>>>> from userspace when needed. The constants here cover only
>>>>>
>>>>> What if there is no userspace? Or the userspace is different from what
>>>>> you expect? I doubt we have TMD-speaking userspace yet.
>>>>
>>>> Thanks for mail, The TMD userspace implementation is available upstream at
>>>> https://github.com/qualcomm/qmi-framework.
>>>
>>> Is it?
>>>
>>> lumag@rohan:/tmp/qmi-framework$ git grep -i tmd
>>> lumag@rohan:/tmp/qmi-framework$
>>>
>>> I found no traces of TMD there. Moreover, I don't see why QMI framework
>>> implementation would react to thermal events.
>>>
>>>>>> what is needed for modem and CDSP thermal zones on the currently posted
>>>>>> targets.
>>>>>
>>>>> Again, SLPI, ADSP?
>>>>
>>>> Sorry, I should have said "generic subsystems" rather than listing specific
>>>> ones. SLPI and ADSP do not require active thermal mitigation on these
>>>> platforms.
>>>
>>> Could you please provide details, then. What is cpuv_restriction_cold
>>> TMD?
>>
>> It warms up the zone when the temperature is too cold
> 
> So, if we ever get back to supporting warming up, these TMDs would
> become relevant. Am I right?
Probably

Can we do some progress with these TMDs definition ?

Spending 95% of the effort to discuss 1% of the proposed changes, which 
is always DT discussion, is quite frustrating :/

You want to add all defines for existing TMDs for all platforms ?

We are talking about numerical values right ? Why is it a problem to add 
their define later ?


