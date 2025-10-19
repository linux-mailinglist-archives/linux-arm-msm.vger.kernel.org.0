Return-Path: <linux-arm-msm+bounces-77885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033DBEDE0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 06:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AD5E4E290C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 04:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E354147C9B;
	Sun, 19 Oct 2025 04:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVWZ7fwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D0354AEE
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760846910; cv=none; b=VmiHrpZPMRd1dsNPDcCgzCSc0z218FE3lVjzUvX7c7aI0/S+OQ0/gm4VQgn4KzuKNWLY3cLjceA2CVpqf/pyJ0jCcipkxpRdc38m2yRI6dtvq/NwpPIc4iwPyLockqe/jBTu1lzcCOF5evZqcsV9CJkeOhSxJb5KBhB9josDEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760846910; c=relaxed/simple;
	bh=PYQScSZOYoE1QyTJBk6buoc5qNLZZCr+32xrpVAzVuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCekSEL7MASuw7btwpXT91NHMVcWYOqdi7vRKx+U6+1K4OeMG4CdIGM88zx0I7KaxVM3qs0OZk/gGt//FPUDeg/Htz79oMXlSbnv2Vk0ynmV5IVy06ndDEOREUKSvFa/V49rJfvpzfOYOzztpWn3jR4dOZTnpYCK43ZPCL909ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVWZ7fwi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J3GaM0028210
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eXtIl7gx2a3Jyse1CDj/YUds
	dckxFLnn5liYk/3DXnQ=; b=XVWZ7fwiNdHgJNJA672XFIDVSSDeXZsLaXAdgl4M
	zCHJrfEgm8LrYeUW330MrzQwl9M+tTIK3iP62ylNyAiih2Q8lqrICU4NGQ0aNEZg
	fBg6VzLx8Mjr4xJqnvKna3Xz6mzOsoOCHKk0X4fQPC6G72sl+X4EBIpQoVVNAfAb
	d/OBzlHz9JiGXXKeual49iQZnFnMbx67EolgQ9kq4XtHma93DecF8XByHabxEe93
	a0qldw06+YOTeTvz3yy4vNO1FcMnAyhBKSUHdwIZWLLBQK8PCVkheivK4BEwrgIK
	J1CBZsKbH8olCx74m0LWXdCJrubXyL2gKFb/Sz20PRpw2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k1ndw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:08:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1d4f68fcso175697646d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 21:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760846905; x=1761451705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXtIl7gx2a3Jyse1CDj/YUdsdckxFLnn5liYk/3DXnQ=;
        b=pwPr3cOdR+bTqt2IYazt4K0W3LZclG8GrBOp0Uw+F+gpZaNLwJIjGLw/+9BpljwKOH
         XDuvtDdmXDCFUEf6BJ4seVP4y7C8yYobWsGovotwX94edYZtUCqogTugErCoOzN1j9US
         O2u1qZpIGUnGzTiTqnxCoy4gVvwYi/2a16xTQWnQqRJRhZpcnigWdlN/Je4Q18/x1M4o
         XZ4vpxe6T3puGFUfRGTmwDd1gm7uBpNYdS7B1DN8Kr+RBu0PG6HjA2TKiYib+8iC9Z6E
         Vu/wvDpdZ3NFAEd9DsiOf6h5y0boNcvpKpbf3wnXdrUcfBmHcPap7jlx9B42xuyfSN2n
         Ny9A==
X-Forwarded-Encrypted: i=1; AJvYcCVwZdTR9HoszGd1bzCJUO66D9pH0iq601lGlQRJM/Ylr8W3shJ0h5cV3Xnu5Pvpsl6aP83QOuFWLfJDHmD/@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCnyp0TR8ZEH3vm/Vgv9J6GReVk24BAgPZw5ba4yPG6dzOi2v
	VlXzDSBG3/ux1iS7YpMF0Qjcc0+Q6/ugLM4skHVgxwnQDkdhi6/wY1EgklwycWkOAXIqDfrflqu
	l2Rxvqc6piySMCo0SHlhekVMY0rv8Z1HYpjoMu07N5EOj/us/sPEholDdKj19wuuywUjh
X-Gm-Gg: ASbGncuXJauuFKNBxycBho7Tkye1Tb5FeayjiENKG/jeGKpEjYEjsgKebmtMO+lBY4/
	tff3cIZ3v8cgHUghvyvIU1TRY0qp3veXQJLcnKH1v5kBpMKp+WA8NbeNaann10Y3XVgNKWy3jdV
	g9T9ZhFUt2uc+esm6xHlyqQzKbonFxVr+6WspHR+7C7L06MLH6i5NvQKJ4SqI7gwBu95LOGC5bO
	TxM+JiK1wMi4TeNALb3M/m+zlrbybCOxxKPp9R2VCG3VPSWeN51QxOkDhRYSeJnXKQXld8VAI2+
	NWbcjNrsO9FyTvgQV4604imhTZHXM5dwGRFvORQWyREqwHP1FtSM0XONAmwyDNOgPJQQp4vlVku
	mqVC587isbDAnboR7Cq9qIEQqfJhCF6RMp+04R+x1imz5Dz9WBD+4t0B82QZz+1VBWioQgzRv76
	DWBIR+UaV/xuc=
X-Received: by 2002:a05:622a:1793:b0:4e8:b4c8:3fe2 with SMTP id d75a77b69052e-4e8b4c8412fmr34739641cf.11.1760846905214;
        Sat, 18 Oct 2025 21:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwjpMQMP09kJ0jfxgHAqYveaQLqrlnJM2EpETyDsZGjRJiaYgkp4Ad4myb57SXe9M/dpx8/Q==
X-Received: by 2002:a05:622a:1793:b0:4e8:b4c8:3fe2 with SMTP id d75a77b69052e-4e8b4c8412fmr34739361cf.11.1760846904593;
        Sat, 18 Oct 2025 21:08:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16b31sm1225608e87.60.2025.10.18.21.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 21:08:23 -0700 (PDT)
Date: Sun, 19 Oct 2025 07:08:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-ID: <oghgx6bzhcd3uoju2exzijoe7titw5kuhyk5g6hx7rdcgjsvmv@fvsefyhkeaui>
References: <aPMyw_ryay9LA5SW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPMyw_ryay9LA5SW@stanley.mountain>
X-Proofpoint-GUID: vhFbbPX1GXoQKBp78jPUouq-h-jkniQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX5/pIOGeyESQ8
 0l35boM9Ydb2L5SeCtMoix4Kj/WRHJYWsDwfjq+5HzssAUgk2KAc4kPQqtsSd9jHl45wPgi5L9Z
 ZUT5sxboHoVP7LOdkiMRrqrDxzdgLQLOzrVDhAxCLtDPuaGlWkLU4mvVM8NhKIFhClFgIayJsAy
 izmGEOzMdmEdWyur+K6RUNtHYr5Xe/WQbe98YkHQBbahOOx1B3uFmx80Li30WQCiPaYXNzV/c7s
 v0Z1cFmrQwpumssUb2f8ij49u+zKPPlSJgsjgMa5X89of56j7HTok76MZT3Hok327r7nughFxqI
 OmFqZup5J4xKmKRFTUsVt1Tens4pbw0N3CCdz+aOYKfGXOA8ejFyF8TTJuIcoHu+QmAyf2Ri+h3
 53d+ebThSgsjXrQ5ayVUTw0oox3TQg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f4643a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ebUXpRROGgZ4PK-tThsA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vhFbbPX1GXoQKBp78jPUouq-h-jkniQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On Sat, Oct 18, 2025 at 09:25:07AM +0300, Dan Carpenter wrote:
> Do some clean up before returning the error code.
> 
> Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

