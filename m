Return-Path: <linux-arm-msm+bounces-99224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGigByYuwWmbRAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:12:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C89032F1B53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E571030603DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC4339BFE8;
	Mon, 23 Mar 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmgghD6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkvdOq8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72C41C71
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267675; cv=none; b=JvpSYd3TFHmjhgpN/BArpJpb7mPdqGwJr6IjkkO7VNWMzzJyDRJOtoA18dz40jc2KNW4BW8KwF67+oOOhmNKXa3ncemyVkrYaLQ/+uYi+564usmKM/FmvatEpvzRHsnO0R9OrnjZI+Cg4mwZQaH+XZKdzhl2e+Ux0oG/opLgHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267675; c=relaxed/simple;
	bh=DeUtkYMvSFJClZBnpmEvofUsoZIM3pNx+xxuBb+a8fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYDBYQUZ/VyqER9ahpWVcILX6B+EW6mpZyrvWm4V/wP0aDJCD7QO7zTOWkq6eswDcD5KbeKyRr+hlEIMg1xhXdw6p5G+LV0EssrGqgmVnqeGr61+FF66sq5np/uAf+0H7FwYaOgALJi2RxS6H+KKzAK+YMkehA6IOKuSSYgXzco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmgghD6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkvdOq8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NAJp4P1584563
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbKIFS+Pc1Tan8+I8NB9EeNeQknosIAeHFs0OOQ5r9M=; b=CmgghD6HusxlT1/O
	Aw4Rmj3Kct/fWZdgGJLNRqd5Q9ESLe+Rz7b/gahS9esZoG9DB4C170yfgJdWClMu
	O8/N+8xe7s+fCGPUY9fvPRbvjtD7otWdgL7Zkb5tGvS1vm2gTYbUwsk90Nru3rdX
	zNsQcchGxXUavm9+GHN4f/52c6l3y660GeeRl4NPBUskXxu7JSMcAgCJf4omAnji
	qom9taYTol05E+qGj3yIwKLm3fqFA5XJQcgUsi/wpXkzSOje+ZRfFaR7aIGdJHJC
	yZjY9YCBws7DTgho7yu1aWVl3umdlavHio/4uL4hbwdn0uoUyczdEqWwL6eEqMW4
	vhQDVg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng59hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:07:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56b8e4c7c35so427758e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774267671; x=1774872471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbKIFS+Pc1Tan8+I8NB9EeNeQknosIAeHFs0OOQ5r9M=;
        b=DkvdOq8Tu8D44ATNIT/lS8v3Ww851sQS/AOllQ6HruZYL4xGwuWOPX/qEIzUXDjV6D
         XIjMaOLVsxHAuZNpDoe01BAHH5ufFaMWGutj+2m9q2pNgn5a2mcudqVLRSDByhxcyaHy
         UrHIIBi+J4Xa23gQxy8sq6il+35wPrFRUI6vkTzAQCdoHNQDncze94NoTGKynxeSie0q
         hy9jfjxPK6Ip01sy+cG8beElx+b7OTzl5RkTWY+Tj1tMcAdCifB2KedT6PBlaBfPk+Wh
         Y7tvIC90MBbtV2T/dEy6TwsLLH1TquxbsdV7A5F/jj5pfpDBoJR/dCuPGLf9F9vVJPLg
         tbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774267671; x=1774872471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbKIFS+Pc1Tan8+I8NB9EeNeQknosIAeHFs0OOQ5r9M=;
        b=IJqLZ2N7CsDCxlnqQxCUuuyvlZSV6Ed1iMHyri9za2I2hTm5uVgCAo/hYjM35jZ2n4
         VEQhF+wqXKgTpGOr/tsCT0kTdhsPzOI20nLzKpGRLGbBcllau1jpjRIzK9nNQadfLdTP
         oFfjtBGhjnRQ9Hl9fIm7Gr3rAXmT/sXESxkrGuwHa20rHg51NqDcW62Et8wCpo0FRlpe
         l1WXPj0+uxWVvE/fSBCmUxkfgFxCwPEJqp8yemFMUbPwSYy6xRR+CKH9dGxmXG6AkWi8
         CJPjl7dFuwe12I3VNtgiNZ5o2q6mu7lhLyu87qivcYoOPuqfC94Yh8OBc7a5HKyhpiDi
         50Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUvxbKVAbFxIZlF9jvwIwkEThAzXzCZ+prnHsjChkZ/zekxNhmPzmA7nvta14HHw63L3QZV52Zfvwb5hg9E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2IYjClLIzFh4/KCktfP2zujp08N5bu4pg+CrloBHMjahEddb
	EowFf805XOEv/lLMblN5LSRXQtg+Ju/mgjNu7PbwNlGVaLqT9Wd/5gCvbuehNbAFZe6TEX05hkW
	AKZhzUPKEXvtzEncIMmXdUQmutahWZzX4+iEit/I/4RYqVD8Pj745+NdYcC9jl7VwDvQd
X-Gm-Gg: ATEYQzwHjDfMjAdE1pZajarL2qeNF2dfEv1q1PfpcuzzdaWNk4lIGN1Kl4tMzUTq8Bw
	9DhJbsVeneIEiYpmrkbNzI6kMyMig/60+MfgzkQpJqhNNwdz+0g/7vICFi9/TC6RRXxIMEb4Pvt
	oGhtdPoRtPz+B+FqY7chCsmrVkWGbd13sjnO4nsM/1u56p+WA+NTFAVmZ4v+NY3F3kIQ67EaBhY
	XuSm8VRsO08uI4dCClH+9I9UF6KfP+bsMMNz9RzxLi/MqeCDYh/fUsS2Ef+IsC1cUcWKXjJW7bw
	y8yCU4lg93hFKrX9acGg6O3+pb58jDGdV6nuWrDVtUkeUEALWxNhQ22i0hb6JhmxwwID+qfBlaa
	UuGq+BrO/EzDCPW1+BcrAEWqb6ihlYur5+yggCb5POHhMdH6H5V8WgkJKeoUafj/hHOB5Av+Mor
	rJF8U=
X-Received: by 2002:a05:6122:2218:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-56cde44e950mr3237469e0c.3.1774267671195;
        Mon, 23 Mar 2026 05:07:51 -0700 (PDT)
X-Received: by 2002:a05:6122:2218:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-56cde44e950mr3237457e0c.3.1774267670762;
        Mon, 23 Mar 2026 05:07:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm480101066b.9.2026.03.23.05.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:07:49 -0700 (PDT)
Message-ID: <2c8fcd53-a9d7-4278-9b08-fc8014714e01@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:07:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] phy: qualcomm: add MSM8974 HDMI PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com>
 <20260319-fd-hdmi-phy-v6-4-cefc08a55470@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fd-hdmi-phy-v6-4-cefc08a55470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rZi3VbczlG0XDv7b_uiIaqrv5SlwNRgl
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c12d17 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eu74y9pB3kvqzmodUKoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rZi3VbczlG0XDv7b_uiIaqrv5SlwNRgl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NCBTYWx0ZWRfXzhXtRBlfWgw5
 YOnZQdae8vGnJtcMtnDCp1nM91Z8H1MegcucxhaNY3j4ub5gGAhCJ/O8iA8+/2xEsGLhHoonFxX
 AK1ixIvSpESmB6Pn6Fu2aRsVgFHU2ly0+RcGRAD9pdAhSpGBj+yjzIMJ+gHUdTQo03EcPDoIsMi
 iKddhWYI+RHUQ08wv2O9yAaPFE2yFDjFazLKy+p1/O7q9qXKrLtkPe1HpFxWGf/WqqLjLEG0187
 mblAE1FUkHQAd+9je0X221OXF/rbZxsbo6vj1a7KCLQ3rgAJ56XBzvMK5bNg2E1s3Vuf0NgAxG5
 Py+1H/BZiya3qojNgHHlqqTgFzjs0EEI/osRhQEwS/Gx4MiK62gSt4JxYlKh2hH9+rSjnsU6ZoS
 OrCoX2E4lEB7cHnkkyxfa90yxBeWuAn6Uqh5+52j+Eqmmxvk+MnWKRg6tWGeqG6aTiqjZkYmcHj
 M3FLnByUsYDZNtzfZ1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C89032F1B53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 4:48 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I don't have much insight, but the code looks alright..

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

