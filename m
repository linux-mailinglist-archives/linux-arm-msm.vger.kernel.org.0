Return-Path: <linux-arm-msm+bounces-100720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EDQElRDymky7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:33:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51963583D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B33F30300DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813D03B3C08;
	Mon, 30 Mar 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEXQYG57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiABGweA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300B3AB29D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862848; cv=none; b=WVNciFV9QIOKwDWbNOIV5/wmjQw5rRi8BY8RpEwCOpb7OjOfmnmdc1dVE471lXXFuwzzAVHbcxJHoY1CAq09q2biVLc3t66J3MZVUKm6E+8jypQmqNVC/mHiI4Gmn3GlyAyHemZgkEhXg7Wt4K1g9yW1SjDe1TmeR7g5tsJCoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862848; c=relaxed/simple;
	bh=Qbngn77JdyweWLsDY3IBnaFTiTzaPsOZMt+WqQwrXao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmXCR3ZZVsKYt8UKjhXU3KHkzJxdNeTGBF1uy8h8gUQ9TV8HVEUt++Nq4vuGNvSCZZ6qbu0vvyfxUJjqZXbiBlQhZWlPblKcN98oDGVhYOcJ+f46Wc8vTFiZL6Rpb5ku1FGLvh3u3zvYbc5N/BhOeJ/XlIT0/5x4IyQjdU2bFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEXQYG57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiABGweA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7oIkc3424452
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lRyP2v+TyzHmUXjihsV/Pp6jzdERcDAdIA5S7gMZyE=; b=AEXQYG57WEYZW2wf
	nZgJJsWxwyt97vvvMl5Nf5OFkpgUeTOBseIXl7xXViKHkrC6LwE3ROcLOhywZnrD
	diiw0FMrnZO4rfgD3TChlSr+/Jt/Vz3V7jRYVRT6vfuN1BikF7tba1CkzytRg34V
	5fR4LYcdbrHfSDEQFJwHtEp0z/372irX761KzTpIu1HuySihq/oIZW1+MnmknH/w
	Szp6T/3iyZlpxO3nHdm92AGmsRyXqsBfVxQXCzz/g3k5LVML2n9vcHKYqDXXbSK6
	bIOeBGxtjriszBam6Kl7oOcQV3TqsII55Nzl5LaALQ5WC7tbL3LKbtsnQJ2odGk3
	RapqZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkhxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:27:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0b339b8dbso59645125ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862844; x=1775467644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lRyP2v+TyzHmUXjihsV/Pp6jzdERcDAdIA5S7gMZyE=;
        b=LiABGweAOaIL9B/m4N0Se4qpk/VQTrjUTkXg+JkSq6sC680koLdsaR4/MhfpdctTIu
         h0xw4VDnXG5E2e7A/NEQr2NsoEWu6gaTFNPfJVxK7vDPvGvXNpSfzkSLf7iqrIWacT03
         D+boWEBYxlez3ZnSY8sygkLxGuqjikoPR4s7qOr7oRRme1LlDO+xw7mlr0UeWwLBc1OB
         v+cuz0Wvnl9F+pVJU29eO2NnqoidwZBPOKtRzLIGMglXMehnxVaH4oBwFy8FNXIi8hYB
         86g6eq2rQH9JDct7XLIvj7WfptFa17A0NbHwCrAh8J747s7XqMr69Hw581hVMgfZuTqr
         Uk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862844; x=1775467644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lRyP2v+TyzHmUXjihsV/Pp6jzdERcDAdIA5S7gMZyE=;
        b=WfiKVqKeoLbcyZlSnA5PfeCo0emLW8es63wg+mMwP6zjP/uniRJstv78jHBePFr0WP
         Ske9tjX2IevP1xtk+xpc58PIfJo0+nQF72BTUPAwqoxSUoNupKylxolfT8PHenE+Q437
         OvpOfLN1jnPdxIp7nh5Qr0H2x7RWSDgPtLQqDh9rw43OFxq8fV6uODoc6aHN3FEmxzEJ
         Te45DhZdf8+B3P+HJ6phSVLr/h8As+RUQSGs30HjD47WD2AaOJW/Y/x2FLFMX/YKnkOH
         fD6uiRXtDHqj4GEB6lZlzKdafOvN1keOoIKEOVq4h2RolHzZ6bb49Y7awKsPXGyoMa8E
         5P2w==
X-Forwarded-Encrypted: i=1; AJvYcCUQZ6llWL9jUAKHqD5CaB9lV+PwEiqy/hht3vs9Mze0R1Q9clG9pORG1Ioy+JewVd9ZZNsqRyI9oBFPUaxF@vger.kernel.org
X-Gm-Message-State: AOJu0YydMedXepIR7cJqJ5WkzFAt440Asp23jztyIu1ZSsD44JVgiFj7
	Scun2BUdzs4stGIYwwfrSNIHf0WCmFSs4gsqEN0PhGc5d1YC6Lw8ixTjODDJSj4zz5X/dZvFqbV
	X72JSWiB0HAWC9uUoavEBkRpY5d388R7GpUh8goTpyWeeWp9GLTclfi9O3THjE5crsmAcz3GOkd
	6S
X-Gm-Gg: ATEYQzwzwwWOfFZZVzVfmJwSSwB0FG/LcgjaqDO3xZQokMbnNPtKuiFX7d95BYLAjuB
	La4qamAuF4biw2HincQ+IwacIwvP4PHvoG+691lSAW5WGsrXPxYx4M2s0RntCSOBMaC2WHqf8IH
	xgAcdbkk8NuhIGWwiRKQvnMwFGWvulwWaSx4p77FunBmTCwoQYF5MMjga8jqQrH7gg3oXNIttSk
	p4SxN6RBpYJEV+iQz3O8tFiaGWdjwbt6po5pgJ6TTYVcvJzgPA+Cs3qleGf3MSKK2yqszxCvBRJ
	bY7gESDCwE29tBCu+vQGx5a7qHRepgqZBnyUiA3YDFEhDyLXBrbKK4/H3Q75xHIaoT4XoRBWrXm
	zyBYFjYsYrHsuvOx/ODFRjYJgjINLOFi2I8+RhqQbRj6ThFKJOHPjxqHJeIixkOkg9Q==
X-Received: by 2002:a17:902:ce8c:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b0cdc22fc5mr126256975ad.6.1774862843801;
        Mon, 30 Mar 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a17:902:ce8c:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b0cdc22fc5mr126256655ad.6.1774862843338;
        Mon, 30 Mar 2026 02:27:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642913sm72585395ad.10.2026.03.30.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:27:22 -0700 (PDT)
Message-ID: <b8e920d2-78ee-47fe-b26c-709be4763dc5@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:57:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <20260330-ipq5210_tlmm-v4-2-b7c40c5429e5@oss.qualcomm.com>
 <CAD++jLnwqDgKJMEBomgGSt-Mo90Tp0Or0EdRx3MkhM9D9dj=4g@mail.gmail.com>
 <CAD++jLkp0AfxUqAHzjJjS8k_NcbHyT4qy=yPhUwbvAYXcAhdZw@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLkp0AfxUqAHzjJjS8k_NcbHyT4qy=yPhUwbvAYXcAhdZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MyBTYWx0ZWRfX4WdfGihBfJtD
 3/EFKHEhTcHWS7TgnqZsonjdT/5s5Uh+/1S+wqMT2HWVhXZ2JCqDBCXo2ZzQy2WGQAYSFnmDBR/
 MptZ9/zTgF/Fw0L+oTO2+kifwKyC5uCVMrvqT/AGHyvTUfV2eWZQShKB0qyzHxqE/IlQQFrBUlW
 G4+ipu/b+cgm8T7WdlhwG8lDdNMJD4xM6r9dk+37xo9ldPeLfka/dKJ0wTjYXA/dvXy98/CdrKv
 gB1PafcGOTXsu2JMGedqqPkJ/wCohs0CYfkAyJm7cyWuDHGhv12l5s2OsZjDZ1g1M5xnFtsVZ8t
 C/MuXK+8cLuC7rmxfY2pEJdsGePe9J5ug235Xi8CLMkGA5C8vOcA3EQ3pZYK7bn1s+L4SKd7YYQ
 YcqOS7ys5cYbhnd9UE5CJIbVdhH5PhdSN4EJ+P5LFRRLS/2la+00H1/6es+7xKIfUNiwkVC1X8Q
 /ijaLhwyn7UjxpvvMVQ==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca41fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ucmReQScbumPMK653VEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NJTOzawJ6b1IV5Un1XeMlmM4Qqztacap
X-Proofpoint-GUID: NJTOzawJ6b1IV5Un1XeMlmM4Qqztacap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100720-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B51963583D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/30/2026 2:19 PM, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 10:45 AM Linus Walleij <linusw@kernel.org> wrote:
>> right before merging this patch I merged:
>> https://lore.kernel.org/linux-gpio/20260327171240.3222755-2-mukesh.ojha@oss.qualcomm.com/
>>
>> On Mon, Mar 30, 2026 at 6:51 AM Kathiravan Thirumoorthy
>> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>>
>>> +               .intr_status_reg = 0xc + REG_SIZE * id,               \
>>> +               .intr_target_reg = 0x8 + REG_SIZE * id,               \
>> (...)
>>
>> Should intr_target_reg be dropped also from this driver?
>>
>> If so, please send a follow-up patch.
> After reading closer I can see it definitely should be dropped
> so I just augmented the patch.
>
> No need to do anything.

Hi Linus,

Thanks, I noticed the Mukesh's change and I thought I can send the 
follow-up patch. But thanks for taking care of this.

Thanks,

Kathiravan T.

>
> Yours,
> Linus Walleij

