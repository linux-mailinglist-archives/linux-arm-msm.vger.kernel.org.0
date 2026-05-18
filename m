Return-Path: <linux-arm-msm+bounces-108141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGe0KtrbCmog8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:28:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD782569B6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5977300F62E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3F53E5EE6;
	Mon, 18 May 2026 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAshXtPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD9K/O7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAA3E3155
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096135; cv=none; b=CG9S5OyBVYZ2yev3yWpOaBgD6ZoEKN8pr/QZh9LXIVg7X8HD+SpD6Z5Df9bCEgs3YF6r1IDgnZpi8pOEnE8Z2ebw33aB9W852wyQ4MnwdKe6K1nzoUfR+cgxd1p9Ml3WWMAJQnE3pX5zDpz2Suk8sNM/DT8ESeHqkL9q2r9v5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096135; c=relaxed/simple;
	bh=iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=possCyX9rxfxbnJcNdnYS1xPKiy+RFOKs2VirSnfJJNNdHtCmB2nc9PeVD4Y+G+/cgGtgrzxTxaGtOjlhPYVYbu58AkCpttGi3STU7xU5HZiRhxKGHk0Se9GhL3o6msGgTEqIwyY293k9zTrUnTS8gHd4GPhKEPf38exGuPeBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAshXtPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD9K/O7u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6crOn483452
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=; b=OAshXtPKSwEhF78G
	kKJB8grFb3ryLy2oMV+FrTX2j8u6jc8/t+h1WY2QxGcKsWrZzKqW0V7J3DkiqwEm
	dWU0KIbsk+Ed6lTSUgVC4hFmnKx7Grvz5uYHgge6GcU0L8eFyjviVwqsnUI5pB1Z
	bWCAZxQXt9h+oAn0mj/vlU5itqDdLZ8GPoT2WBPZV1auwArMH3gEIIM0BGUJRmjj
	eKKIY1Elva6EjWPzUhduaRd/zydiC1T/QNv5aFAG6BKQC3VEUzk79d3q8RlVFiUP
	YmAh3ioZjKAsG4f2yqXBQf18ozX3OIAetyasU/KwO9Z+vbvVhVvxS0lEPLak939R
	MkgS4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcmj06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:22:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca4966fe6so6433806d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096130; x=1779700930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=;
        b=YD9K/O7u3wRhA8FrP0PPoKqCnrKXaeHi1HY8LcyX2Ci+qHyzlQoR4WJ29nASRE/Dc8
         FrnvpDOfCmpxq4u2XXXoXLwguQUZumhlimzGcSetl83lnNvlQ290ybsbFA932PR7jlox
         w+YAJzpHvgtHobxKK6b+79Vc/kWypvYoxmmqK80JBciUu2i0zsTXbSCI93M3AVXglnEw
         iYxErAGomK7lhru3iLsP8zcUpe7nsT5KuzF4htXOqogGg+jGP0/31eJDP+8DFnXcyaA5
         oGxKBa8YOFElypqdRyv7DBuOCE9sknOJlLcqACbQZifD6o7DsGhNDBVXCGz9vR6Xi25a
         hV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096130; x=1779700930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=;
        b=PNLiuy6xJEqLQzERe4P8de9hXM25GFjMMIsOZV/5l+PTn/Vo0kU4OJ7d1MtdA4LGZm
         Anxv4IPsTOC3n9K+rqmnnvI1ppGVbGngUho/aAtz65rrxRCS9+bEc0z74AcnlJdZpzfQ
         vAhCVjgpQ/cW6jzeW+TG4uFULBFVR3Wh8Eo1VcQdK2dTao7vpwrInIoKKZIlotVwzl3S
         79mZ+fqirgMSFnqOAqbvX34LqWPN3qSw/+KmlNXerT+tE7BTuviaPhAKcbxN7tiRrA69
         XBWKnOoO5Z8qWzaaRbrKKrDnyDbLsJun4elaw2ZGt4eSnfBtfYWbRFpucfawm++Br8qA
         FR1A==
X-Gm-Message-State: AOJu0YzfLleyiOiDOAy3oZOy/w78Gp60GCc56FwxKFRmDFddX1pu3OD3
	jd7sOBzq0p8uFhbvLmNDU3fNIuZBJakzWM7f/VDBAAra/etgwYV7R0pxehJSHpmrxxzRKNbjKQP
	y/XqoTQXX5H8NXSOJM1LLFrY0IpOCtkPZWdGUONFA/Flq4OXdHyWBXL311prj99RdcJqF
X-Gm-Gg: Acq92OFMZb6zuAnzO1BlYxKKu+l+/NBOTepRvrjO2kzDjArvpYm51TemyykwMgiwOMv
	k95dQCYRF3s2hFMicH2TjRdgaol/hp+KjVIGvvhr39HPakGZURVTEqCp66mZpzGBmGHqEgsXpHg
	ZfAlJSQnw2vuI7r7XVY2ePDeMZB1ABN7rCTF0QRw7Ew/AIWuS9BZTGcV5YznSeZs50nK8ht6yU4
	Q8859Wk0eSi/IHRPwZDogB+D6FwWMnupmXCvBe29cCKm0dsEDabEsp5MMTYK9co7JLR1Gk+Tbat
	wohuliMgwhD2tsvqg5ApXJ7lwUBnWegxelMChKKHipSpE/2QsbmMF9reZkPtBVzOA79EMufHR/J
	Rh0WcspaoQpfx6jzix1cUIYCS2hX/CzxF8rx3uxnfIbabEctqAgPy1bTuSBlWvKIH5vj+TSR9Zh
	AZebE=
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr148722811cf.2.1779096130034;
        Mon, 18 May 2026 02:22:10 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr148722631cf.2.1779096129568;
        Mon, 18 May 2026 02:22:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5089fsm543797466b.49.2026.05.18.02.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:22:08 -0700 (PDT)
Message-ID: <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Oin-KiOhc_sYuDmrXABeril4bNYiwBg5
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ada43 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ktYNcK5Kl5BpbLUalNMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Oin-KiOhc_sYuDmrXABeril4bNYiwBg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX8MPlKsk6Vcro
 xIxy2mg+tPBhvPSDF6qzo9PXeJU7vhSkb3H+URNMUOVXZTFrj7wMdcsJMnbzVDkwikcoDwJzZxI
 ZSjBJ82lGq7nZihgQKGTNBX5Myd+VoFZdo3RGz2w6FTxQIsESVlo0npHX7RDWvD9VpYe/Swu4/b
 XiSqhfoofEExpLgEM75FoaIqW2mALDeN1hNUQtUK6RZopsVBd5OsHrGs16C1pILeVvawUg502Wd
 41GRSi2AzXFdzmi+X43N+dbLSz9bhJ72Bzr94pLknGvD7S0m1JhkT9rY9hl3QHMPM+BhskQMZ0F
 vkrJ4KCifj7JAjaXlFK2IKAP5prxdOjPqfEwsMCR6ID9aby8UZYwc/a3c4Fi+91EGdhv6jvE46l
 QGyXiJg8sqL+bsrrojQjb0USPCy1PzU21LZrBo3dHzn7WBc6LSAVjuqF4JyHlbqo3pmEUwVrju2
 DqWLQWKYqH7cETG5xLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180090
X-Rspamd-Queue-Id: DD782569B6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108141-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
> Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
> clocks into the interconnect providers. Stop inferring this dependency
> on everybody and set it only when required. As a safety measure, make
> sure that the coresponding clock description fields are not available if
> corresponding Kconfig option isn't enabled.

I think this should be a 'depends on' instead, if you like having
PCIe/USB

Konrad

