Return-Path: <linux-arm-msm+bounces-117881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 70y2HFBQT2r8eAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:40:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 468AC72DD89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E5Nkna3h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T9hvmvg8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117881-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117881-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15FC53048CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E423E63A8;
	Thu,  9 Jul 2026 07:37:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130E21E4AF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:37:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582676; cv=none; b=B7kwyAbauFQ+1dUFZzaRMnerGQE+IQELSXcEvwlC2mVHoFa2nIxSkXTofmVjtGJq8L6VTqtlnoOVEtSY5Ugr6oS9fKZ2dSR7mwNy74OgsYzzqEf5Fj9HRMqNg5AX7EBPLtOxz80UryG7b98awYTLNg/soo1ACYQLzHDmzrb+gk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582676; c=relaxed/simple;
	bh=0rb2z3DUXSytPJ4s/yhJPqz1ccr0bjpcfkzPhntULf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a973/H1IBeGbtTO6MsTXUlDvdkqgcmqRGH4CVKWHuG+o8jo+8ZaOw5c+AIBg9oSOE6jDHZVuluVQzYT+qg2lcS2hk8BfyScT4o1tpD51Fh8xgfQWErBmBgBd3+lua69VB2YxljvCEAwURzYCVooqfYTGMT4n47q/VUPk05Cq3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5Nkna3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9hvmvg8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669600GM711005
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZxwMa68WHmSw0U1mRfk+2UfIqOZzCIE2fnSeRv4BAk=; b=E5Nkna3hY11WSfQK
	vr+dNXe898mO24TUgsPtlORCuXmQ/fMZykF8MNGuL+exlhr4QYwG1pIr9g1SssKJ
	gFfJU9/dP3WrEfoZDf4lAs0d2wQkIh3BFhlnBDWuh37SOsJ6MXTncX6L5roL0Qjx
	GNF/dWJCgBMx+JX9vAcP51D1vxtan/46/9TqW7Ykh8STedXOonakepaQQSGlbeAf
	8day7RkrvJjv7cYyozuN+fZWuKZE+bOElpRyKYcY51fOFn4G/I0REdWt+HvkC8mD
	6/tyBhWPfTzGH+efIoBGL7yT04iokx3jyfafnMIhlnJz+wiUW1BZIcvf+7KqoGKb
	dTzcig==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgjm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:37:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e806f474so285933137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582669; x=1784187469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZxwMa68WHmSw0U1mRfk+2UfIqOZzCIE2fnSeRv4BAk=;
        b=T9hvmvg81GQ75VcMbYS8vIKFwFca9VEArOzuzJOvKC0L6i/YvD6e++CY9xKHdcCaHi
         4TTNV8cCtnEHGTJ6W56TGM1WfEYSVjymZRq8crbNfOKKtrdeYVX7iuLaMqu/l16P15hR
         laBK2IyU83+/YgtMXvf5P51hgR2nYj1lhxUKFd6qL6qU9PMKuWcQ68wYsRjB69VY8x7u
         ksRokPepm30pep+jIwxEuibJMeCB/du5/JCLpCFEhn4K6SejTNU4o9nwqkg9g7VM8f+9
         UzQSg+qJHf5Bvjcf+5tVwEJZ9D4fT+2BRhr5HTda2QN3CCgb9Zt2Dr3SUu3r4vzjSbwO
         r2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582669; x=1784187469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZxwMa68WHmSw0U1mRfk+2UfIqOZzCIE2fnSeRv4BAk=;
        b=gREMEnO+HeS2m3wkv6SdUZsVGl4jLMjF+5vICX3LjiaXxNRN6jvXanLWYJT5za68AE
         dNxAjIbIKBa84g4XmgoGQfmqG5R0NGyn8qPOZawo4rDU8ZmEWPlKtr1xEAnABaUl4bbI
         8vCQ7dLdpqhUIR8do8GrWscJgIb3CnIVJMhe/hesU/rWU18D7bSTax73FZ/F5B7zfGSN
         tiF3yo3CVDNLfLC/9rDhKiznT07qaLFgX6gOOpe+CaTJsf8YklDMxSHzipunEx5TOrzc
         vpg7SkIwcEI0j9qdP7Xmfz2CONOi83DurMzP3WX8XL/6mG3i9xyymiZbDfswgDfM6SDl
         3ICA==
X-Forwarded-Encrypted: i=1; AHgh+RqR2dFNbK28F1Vmeox/91MPS5C5V52Ey5EF6Kyl6i7hNhsdfFuaAMuTsjf4m9quFU4ybBSv2qjhooEXmpl5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49YzNH+Ul6QugMDOq6y9BpuTBpXIr8y47A24w5ChoVHsuSpAE
	4ghowWEbk6ZLf5YZXzciJJamiaEIxOC850sH2E74wa+jZP+iS56I/1t61yv6QULMFwXO16PTWg/
	zguyJuI2g/ZJ4M0njyIUi60/mVfbETXN86mPzK/qeNeYKZAddSktE1XiZb4s9hrU7dpZI
X-Gm-Gg: AfdE7clLbJcACFK04fpFwiRQSwzYpDwPkZxiIm4FLY7jpGLYQOuBMs61XMdJLp+xjjB
	Nlz9pduaT3g7KXD2PnggffPJf9fEeeGJOe8PIvWnIpE4P2HT8zz45VDZq0iI/o9GZsnh/Y812Z2
	vHKK1ZstO84Kh2sqj8UN6OyruTY77uMuaTe/elLVPo8doKBEqezbWNUOr5trtUQW01wrUM8pJL1
	tY9JFzQHgbJCoJ+S/0uEs1yApaZUyZJiwXfwBH69Et03iS/izjOl3jtF5EoMMbxIjeKJI5Y0HfE
	U7vVxoJAsck7fHUPSVoRPLLGs2zNz3paKgIyuYmE+RYK8MUkZzOEwj23UjSFVRA6JJwdZ3k/Y2Z
	x9jEIzHiHbRJcuWaJUqmuftqOgPz9VpbKOb/7NDVjjUlteCFmLaSQws6hXMbXTSsEcyLFQMyAYb
	zIWtVl/DYfkxwObGF1G1VXxjJ5
X-Received: by 2002:a05:6102:3e0f:b0:737:783d:1900 with SMTP id ada2fe7eead31-744dff69b8amr3548337137.9.1783582668566;
        Thu, 09 Jul 2026 00:37:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:737:783d:1900 with SMTP id ada2fe7eead31-744dff69b8amr3548324137.9.1783582668113;
        Thu, 09 Jul 2026 00:37:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb4a6sm5005295e87.38.2026.07.09.00.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:37:46 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:37:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
References: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
 <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MCBTYWx0ZWRfX2oc6kVulYQGB
 O5OeRww0frNCBaiaKrFj0jfYKCbvpdMhG1vM4KsfWXfHyYX3pDnWCTI3vYJyTb5D/myz9sKp9zW
 Zrcdd7lIJBhFP/qAB1MSl9V6DXquUVqr5z1KxoQfccky3yaj7no9uIjdkfVlcqXFhd/0RquS0ka
 c/xY2xF7N4TMcx+w8f4fjnk8caXHcRL7LKygnKzs320Z77djz/gNwLWFcXHToe++s7Y0aJBPN9U
 IlmuoH60BPV+8z+f+FJ4pso7Gm8mwji9dH1HZcSWPHnbLmxjf5Zaitv+gHNihZ/x6SBRjbttHrh
 NggCIv+wCb51OC1ANp2oOsIUB36bIpIc3QND2MPQPyVTJ548wFpNUzwKgmqD5mAcsDr+VpcUgOs
 AZRRdfBI5xCb10lcC18nPH3QatBh4IOq0cih2Rlp15d81BvqKabnderfh8FS4twQmE/61RkEuKT
 rhtpciWDFV9FqKYY0ig==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f4fcd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=Z5p1CHKkuMEdEvxWcW0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MCBTYWx0ZWRfXzowJ6J/91d2s
 /76WBWJ/uNoEkDDjR/UynyVDro8iR/87nEyQXdm+h9bsMZnmYE634Q9wB7qN0vBSpVURRi5v/yz
 4hbfaA47XFno6iYXS56WKnRO38Zp4Qc=
X-Proofpoint-ORIG-GUID: 3n5oG8iJQWND9M_gdA8cXTIcPwwkkMB4
X-Proofpoint-GUID: 3n5oG8iJQWND9M_gdA8cXTIcPwwkkMB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117881-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:daniel.lezcano@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,fhixqlwbtooa:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 468AC72DD89

On Thu, Jul 09, 2026 at 10:54:26AM +0530, Gaurav Kohli wrote:
> 
> 
> On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> > > > > On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > > > > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > > > > > 
> > > > > > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > > > > > 
> > > > > > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > > > > > 
> > > > > > > > > > >        <&phandle device_id min_state max_state>
> > > > > > > > > > > 
> > > > > > > > > > > Define common TMD device index constants shared across currently
> > > > > > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > > > > > existing DT ABI.
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > 
> > > > > [ ... ]
> > > > > 
> > > > > > > > Why are you using only those TMD devices?
> > > > > > > > 
> > > > > > > > > More constants can be added as needed.
> > > > > > > > 
> > > > > > > > Kodiak is one of the supported platforms.
> > > > > > > 
> > > > > > > What would be the benefit of having more than thirteen cooling devices
> > > > > > > declared in the thermal framework and having only a couple of them mapped in
> > > > > > > a thermal zone ?
> > > > > > > 
> > > > > > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > > > > > need to add them ? Can we do that incrementally ?
> > > > > > 
> > > > > > That's what I am trying to understand: why the implementation uses only
> > > > > > the selected two devices, if the modem on Kodiak supports others. How
> > > > > > can we find out, which TMDs to use on other devices.
> > > > > 
> > > > > My understanding is that is an initial thermal setup. Gaurav will add them
> > > > > step by step while setting up all the thermal zones instead of sending a big
> > > > > patchset. And TBH, that will be much easier to review.
> > > > 
> > > > In such a case it should be noted in the commit message and/or cover
> > > > letter.
> > > 
> > > Thanks for the review/guidance. Not all TMD endpoints are relevant for
> > > kernel thermal zone binding — some like BCL and cold temperature are handled
> > > from userspace when needed. The constants here cover only
> > 
> > What if there is no userspace? Or the userspace is different from what
> > you expect? I doubt we have TMD-speaking userspace yet.
> 
> Thanks for mail, The TMD userspace implementation is available upstream at
> https://github.com/qualcomm/qmi-framework.

Is it?

lumag@rohan:/tmp/qmi-framework$ git grep -i tmd
lumag@rohan:/tmp/qmi-framework$

I found no traces of TMD there. Moreover, I don't see why QMI framework
implementation would react to thermal events.

> > > what is needed for modem and CDSP thermal zones on the currently posted
> > > targets.
> > 
> > Again, SLPI, ADSP?
> 
> Sorry, I should have said "generic subsystems" rather than listing specific
> ones. SLPI and ADSP do not require active thermal mitigation on these
> platforms.

Could you please provide details, then. What is cpuv_restriction_cold
TMD?


-- 
With best wishes
Dmitry

