Return-Path: <linux-arm-msm+bounces-96642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLZMI0IdsGkJgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:31:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B62505B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54BC9318CB09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E1538B148;
	Tue, 10 Mar 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azXXL4Jb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtqcVE7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C3438B145
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147102; cv=none; b=h6QVnQiBFLA/mMgq4eMXTUjpeKysrnEytr0QTE8SORZN1uVbNART5G3DjqAkKILhovKmVbQQ1GjN0+aHgycQjd5QjmmIyYouR+BfR8XA2BAHHukgML1TZW31NsApSCn3QKK4i9vVdyJoyGspUsmJ4S4bollu16HSWvmVCaysXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147102; c=relaxed/simple;
	bh=wSsHZj0oLmiodqGNiVkjJIz3QEw/lAs4wx7GNTVJ6AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCQJwkzh56h0TXwFFWw7n5XQBGAfMzpbkjepL7irQ7O3PLS03iFenEhaApqjppglaMaFaUVd0KGVLu3c6DHrfUAiaqvGRw+A1xHf+UAfdXbx/2fKFfeI9x8GfmdOZSqQ7gv/K3EJH9fNzaJFSU427mkjl3GHhDQnvJO/nHW/ZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azXXL4Jb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtqcVE7y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaTW92861861
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6l+ODRwraoeeVOdJZYX3I59SZEZhozW2UwHSeVkHeH0=; b=azXXL4JbVOZRu3B6
	ugUY2oPC/W0y8JbTTlReFhmigLjrYZ6WVoHWz+5gpKmObiil+ixCUhcUDf9fkgU2
	pYYNPw0q4adiWobHbKZCoE8y17wZNp5K6ExO5+NiTA68Ou3lQIla4bvjapdE6Mn2
	qFEn1pdWK1MsfXKjzhNvooYZIhkOQuthuGlXLbcxsexLtbFocj2J9jmXmVyR0h2S
	pBC7H0HuffH5MgCRgXMrpL92l4eCtEF8ee4vcY1s2zAKNzB/uf24f1D/FGryFBnR
	NB+Ro8Hm8kMvbYu+VqikC3+bUfqn1XTsDesHcQ549SXCVWEB01GsAyJfJ/o9aCvp
	b8Z7TA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9cn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:51:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7604c6a8so224599485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147099; x=1773751899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6l+ODRwraoeeVOdJZYX3I59SZEZhozW2UwHSeVkHeH0=;
        b=WtqcVE7y6Di9/xscN/dgQSY/jHRrU0uT74Ygvc6Xf68VzbV3aBA+8lkBTbI2D/fgoj
         6Cxoi5MiZpwFMJUjlO2yd0pfQcoBZQ8Ae61lsBF1NpQ8RCgjk8SfA2ObeyADcYWqIhfW
         2qr3WO+GGo5NaQtcZMdxPyf9V0ta82y9V9jC2ojvI63U+K3JHra+HU5jVvuVxjz+F6Mn
         yMADwcD7NT8yhoCsJJQbXt2d0LE2deiBD+x0XTicIt9j/sJtq/jKb/9M/bNn0k9iOQwk
         vC9TS7obEDnTspzdQqO+hOgG4yrx572qhX2+SFZQSU4JHry47wbojbxms3owwXrEXotk
         bqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147099; x=1773751899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6l+ODRwraoeeVOdJZYX3I59SZEZhozW2UwHSeVkHeH0=;
        b=vUgXDtNVk7QFvKHoSOhicxF8Z3E9ZxPbGB6CrHVYOgqmjOgGq0ulkMj4+mtH4YFxt6
         lJaxAu2NHz24Ap2M6fAtN/uIEMjAT9WTOcFj5TNKsPKeDJnTe9kRsDdiJ4ooTyF/4Eds
         l+iKAYLRv8jtsYFCqpYRZXE8Gr0wf8aUlUarC7of3p4sS8cPSSbHPj53fHInN5Ui2Ags
         qOduSiY/4psPIHPmCwNukk+S9yJf7HBqRVE6kds1zGLmRc96O/DiPn3JKwTvEfHlF/OL
         I8na2JTTH/+zGt/BhZvCU+LSmArG6x6dsa5ABwk0nUdNqDNYaDeRIocq9Go+cqD8H51L
         PiSw==
X-Gm-Message-State: AOJu0YwRFnNFCfLsn6kEqxR6BfC1Z5K+/dDyGospQWAeeiJth8qcn+ZN
	C+BoTJe3WuhkgMOUCT2bKAFZnmUoosxYAalezH35SBLtXClN4E/vC3kR+2VIi8zHAVJCe8BGGrb
	3+SvFit9K3LDiQF4hZdf5inZqvjJf07df/C+2DXfInDJy3lZiGxd+tFRHoCnTyKIyhdRX
X-Gm-Gg: ATEYQzzHGrCJuNl+troQkgzpbgy39RZ8NWBeVBCyrBYP/owKc946le+Z6nv+WRb8Hhp
	UnbkgDko+5zKsqEKEPZqcOtYS7lGLxo6Ll+QhIYDIkF69WKvLhGOoNVxU8xkS8oNaogqcLWq7Tv
	QPejA6zYiDkhkmm8LpZxLQJ5nVhs8T08QOphxRStW0xE12Y6v5oulEpYqUClGmMT/jFhkyGQgPS
	b96+S5OMZaSxIrF58d/ykKium1ymHn+4idZgGiJr+VRDlQ1omzuVgtG5dw1xZXD7x3Wx+94ctac
	bWkRJ13zqrL1knGesfiDvQlFfCjbW44UEl0f1Kw4wrBrr0MpCRLX0O+ST45mT/SXmf4TznICZ+B
	yqRjv1k2QyPmdVf7XZazYDvO920Clsys/ole4rQ6Qd1094L0NCoSWonklpoBZQeeXNsMJ9RS67z
	X+pvE=
X-Received: by 2002:a05:620a:319d:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cd6d464fb0mr1461878685a.8.1773147099612;
        Tue, 10 Mar 2026 05:51:39 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cd6d464fb0mr1461876685a.8.1773147099208;
        Tue, 10 Mar 2026 05:51:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e9esm4149458a12.21.2026.03.10.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:51:37 -0700 (PDT)
Message-ID: <46e2c9de-913f-47cf-9d6e-d1f85eb7ab6c@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:51:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] soc: qcom: ubwc: drop ubwc_dec_version
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-19-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-19-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX02dr9pYwZPkw
 y6rKzVwj4riDMO3pdE//awjPr6jtwNABGAgWs7XSk2RyG7EVyp5gM3jBW4DImjnQwBp5JBELg/h
 s2rtp7iozErGXle1oFk2F+oS9JZ05tImZ/F6qzDE2oM4dWkHg4d+gKkbIwHqTGVcLF6TLZfx4Ad
 Tm+XwattfA7GvTwO45ga17y3U2kfwpDresSB4O/DtTOIRqLAwQBlLDrXqcpDs/X8eIHJwKnZ4cq
 pkAv8PZ5Fv8wrD9cht2IFSQGAwIri90LE4LY1NBijHkFQm+YCjO0Qjw2cP/KcaJCLI6hVJ6QTcJ
 CvES2wdNVBhDjIEkydTKQxo/9yEJyn9WmVtBN0ThfUVmNLSWCkaWyTqzz94+XGXy4FAsc2J8OMG
 vRkyMKxLODViQltzXi5iFIOtHez1lsN1ZVJErutjBLRE3/wtJ9UGk6NPAHnFylbVPIIkFFAavW8
 Lh/0uD8nvzPU7qKETtA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b013dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AewOadX8G135x_74htIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DW2apx_0bGN7qTebx0miLsnUmtTLRfpi
X-Proofpoint-GUID: DW2apx_0bGN7qTebx0miLsnUmtTLRfpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100112
X-Rspamd-Queue-Id: 381B62505B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> The ubwc_dec_version field has been inherited from the MDSS driver and
> it is equal to the version of the UBWC decoder in the display block
> only. Other IP Cores can have different UBWC decoders and so the version
> would vary between blocks.
> 
> As the value is no longer used as is not relevant to other UBWC database
> consumers, drop it from the UBWC database.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

will we need a more complete list here (i.e. block-denominated) in the
future?

Konrad

