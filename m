Return-Path: <linux-arm-msm+bounces-110600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ3PDaWCHWqTbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:01:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C78461FB8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 712C23006D4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5E837E2FD;
	Mon,  1 Jun 2026 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC42pSrj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEee/TcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BD736C0DC
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318878; cv=none; b=TpYpthLUc9TVrxpcSoGyMQKp3mqw0XFDgNawI3TbhnZVszF0eqkg6sHDJmq+RkOxGHcNAXWlrIRiBroYC8c+8gXQkjTyeON4xQx5mE99AegEiw51Jcve1VUlaTuRmPkoX7qLIjiZk4/FDxXCDkTdh9G2i7SC0YtCWO+Yjx7aByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318878; c=relaxed/simple;
	bh=LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sRcvBEqZrGKOsA/CwqBCFslcDXqgWSSvqFLI82aD6j+N2Mmm67wPntVXLfhdjqR9denXf4wCQ1Hcfdx/5mGOdmsHWP0zD+3p62pPo1eFTAewyoawUC4+HmEyBARpNWvbSkiYjlcYPJcAeef1Xchx/zDL204VbRmpYn3DUbXweB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC42pSrj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEee/TcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eFNf1214161
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 13:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=; b=BC42pSrjgjSCSHjn
	KmPLCceiXWU4HrTBGGIbiTCKI3XDQTpPyHQYyr+Sxneylqn5jA2DIstdbc9tAAGR
	nQd1hGUhbJeoI+aCN2iufghJd/bgDuqn9qmVRxhnhTYJX6eNhFyzExv+5hyaWXHP
	nWEtTkoJAjkjG208cuKXgUD463y1f36b4KbCGrWVeqLEQqqwSj7lNrYq+H43Lbal
	l/KOgfvGpmFbc+2YlfyB2ThEbaMeGxMHfg7tdYB3ULB0KbpbeTVaLzVSU7tJCBxo
	Lf+Mk4wa+w/FwgGTS2fLUBvNeKd38PNPcUTXXJLALmMyPo2gBQtNfkRaBZ/LUPnZ
	H7vnsg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s991hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 13:01:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422b544a4bso1235778b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318876; x=1780923676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=;
        b=kEee/TcRRAGrl1yR24YG3q/m/2yU3C0eHgI1z80dc2VbXtEcU7m7qN+Y/M0t1ZfG2h
         H+TVWWw6DirI8K7qOpuJpcDEC3Fl6ZDtQK8c1L5EN7JiathkUr2ABuA/LvdAXrgiuK3c
         x13gjbY5glTnt/n66QRAwoZsoX7XvOdGrEuhbeWxv0nbvt4uQiKA6jQBPgIVI7m63CuG
         /itFDOSkqcS6Fv7WKuEUa8CVCfbX5Zl6eGsHaJgubQoUzKP6U5oCCKOyuX6rKBbOCeN9
         gn1JkVmbhnh8XX75ONMuqwt5etDjLUHo4MiZ5Cc8bB9fDp8cIAOia3Lcvx97BO2gREIs
         1t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318876; x=1780923676;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=;
        b=HMqIa/nuIoO5LkD3TaU23wL8deIabyNtQ+RKtTbJnrZDjSsTTZRqmcxxS6EjI905Yw
         TuaC5dcHulEsZEIHB0Wbp3StygRi/3bKCqx6ddMo0E+cMLwcmpFtqB2rm5CFSGsOshXa
         VRwO3YlY4n48i+/TWWeD0RuIgi9KPAuOjbVfuARpjFV1g4+hztWqneLcfUdKJ1peVWN5
         55+t6VkZNBeGNlm2Enu0baK6aUQTZHm5WfJL3650r8scFh55Nu+q6j1p03Rpmo7XDE7v
         lHiCErH97f3cxzxk6JapQmZzktNxZ0xd1AEZfgYQYEmqTUzxZrdCan773YCGCna4HOqh
         u8yA==
X-Forwarded-Encrypted: i=1; AFNElJ9dCZmHFMjLE3Ln37QMpi9jpFtknCbkFDd6v+Gg96UtFvI9aM/HFJj0wlqzHonxM2nesDnhOJMtWJ42pTCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwgC8uXFNwjMdlg4kUB5rFSeQlGhmgd1KQ9rH8y0X8h84UrAKZr
	3G5jxXLvhCmea9L84mUGIqMN/YjPwoVBoZJ9wnlgMqcUZsCCB+ba7AlYWn2W+1DcFpxhWcogjvR
	IgVIM6i+b6NpxqC2dFvKWBIeuF2cwCwg08rIQbfI0FLmouetJiSLQ6dT2Gn01T2oW8CQp
X-Gm-Gg: Acq92OEFZ1WmoF0pdGacq2z9xqoXv68GTaC499t0swwF/dJT36ZdezlYQ1tES19MqT9
	Pj9zNUE8d44NeRonaFetQz/eWGWO5M5+L6aevJBZntyyFYoVAOKCuM0FBrYxqKQEl2+nozYjP29
	D3TM27mcP+dnjO5bgGkZ+g3uv80iOWpjxINcWD9iBSQW7Nsr3jjCjDEyypxK+sVVkpakm5jxhyI
	hT7t4l3lSKY4AS8DhOdr415FIt+40Kf1hByCk5NMrQ9ayjifAYJO6oaHyZdd+nrz4kgBvQjTdKa
	wJP8SkTssdlZ07UPdAj6h77F3ZLCNhiw1V3H1uj2N6Vr9K0xUMNT9qgBP1AuOBkF66G2LMhsXU/
	Y/4X8g9tgfdysf7lapWrISMJNxQEGpCCVYBoq5F0bJhcC6Yl/4fj3idttSZSjVw==
X-Received: by 2002:a05:6a00:91e2:b0:842:2cda:7aa2 with SMTP id d2e1a72fcca58-8422cda7ea9mr7765466b3a.30.1780318876022;
        Mon, 01 Jun 2026 06:01:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:91e2:b0:842:2cda:7aa2 with SMTP id d2e1a72fcca58-8422cda7ea9mr7765356b3a.30.1780318875226;
        Mon, 01 Jun 2026 06:01:15 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84238f1ce65sm6219909b3a.5.2026.06.01.06.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:01:14 -0700 (PDT)
Message-ID: <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:31:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
Content-Language: en-US
In-Reply-To: <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Axm0Xrc_NhDapTzpHWPdj7KCSF08vOnV
X-Proofpoint-GUID: Axm0Xrc_NhDapTzpHWPdj7KCSF08vOnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzMCBTYWx0ZWRfXyqX/HWrpwbhZ
 TWPXImz6r6HJRZWuD+/PMGa1nDZbQl8mnkIdbZHR+XIFK4jaM6TEvS4j9C6wKAkRvTpkobYxVya
 QkD7T3WR4c2yIx1iwRdHkzKhDmofTK/KPqbEKe7BviKc0773QsOU/J9QgrXS7dud8hZBqP9mJb6
 QRShGf1ieQndIY3n79QUrd8jc9ZPSCHySYNo7faZmlKOeB3WeFn+jj0rPBr4UYF8cX6vg3KIkka
 xda2VMJCPUbTpv9TULrcO39nxzUUDyEl27SAu6KdGHb6oRNPlypxN41OTL20B5hdODh+He0D4Vk
 Up6iFRoetT90DXkX/mrRv7CVzTZ5opKBpI6ueKTOlu+p5iTKvwgOYveKW9P7Aw/a3ydv04w/ilX
 XRUwVZdvW8pcXklIWOsYpY6pm6ViHBTVlP1ae6dKavdTa9d2EkJnWfvih6vakBr1hY4oUznrCPm
 xWXQ7N4U/UfloMg4kxg==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d829c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=tZ79QRyfKbC4N9tKgJwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-110600-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C78461FB8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01-06-2026 17:01, Dmitry Baryshkov wrote:
> Is it completely compatible? If so, we can drop the driver parts and
> make Glymur fallback to Hamoa.

Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
probe a non-existent CSIPHY2 register region.

All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.

---
Regards,
Nihal Kumar Gupta

