Return-Path: <linux-arm-msm+bounces-52638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A751FA73216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740071640D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606412139DB;
	Thu, 27 Mar 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lr8nhCDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF82135CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077497; cv=none; b=ZpKvYIEWWLy2YEsS6SHD5sISunUw7f3rtAfViq+SCVLuwK3xENVHijkccioOKnc5FBRf8wdKhBq4aU++eHywLQ//7yCJy8Pxdj/+g9DejHG7K0eJT9hpR/BolbWENgMKGE7MKxqkjQBwCbaMKlA7YMHmld0GDUvSskBD8cY4K0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077497; c=relaxed/simple;
	bh=tndzETibK6lG7lftjamMebr+8YK7oeeGfPg6dOV7tHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpGn4w8hlZmcVFUoe3hnxLhssZyyYidFJdIWfpzwQk+dc9SgFFDcYewGTAZeji46R91K87dZBB3/BQEZya08Mj+OnyAVDlfIV9EPQsx41nH/oIHretBPpsyFB2hSwOOBYwa6I+wQdTAF8jWpUtngH8yfiKRSYVAsna8cNzFwFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lr8nhCDb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jcLq011052
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NE16tS8ju4sejn+fVWcYypEd
	w2R6sqRR//7XNvksEII=; b=Lr8nhCDb9K3dI5Lj0Hc4wVfHCAjYkW/OD2PLwyCd
	FIzbs9AQG8TV1uvzf8zVvjfCBm0A0Ja7bLfu+qRvwyUfE1bE2kssRIDbY7/NwFgX
	Z36YM6SITGT2e56Nq7WnqmBW8Sc51/fbZrGwbwCJlBcS2SG5DcdPpFeBg02g2u5Z
	q76lStojz1HRhNyGA8b4kLOsmzfmd93Rcf0VuP3JV/Ft6kIOlshpiMQvyyR0GJaT
	Mwg2qQuQwozkIUE9J0bhFn/HGJsi6uMq9hqoC49nLc/Qhs7u7YqK6UHKafBYVjsu
	xvs3O8eOvnWYmY1eOmgi7zT+YGKdPp4g1/e2M8yqYnOX0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyghfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:11:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so147430885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077492; x=1743682292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE16tS8ju4sejn+fVWcYypEdw2R6sqRR//7XNvksEII=;
        b=Nr40FtsYTPakDaRLDWPvs/EbEf4GZd+2zEPFWPVnHlNOT8aOI34s0DDv9KWJjDkQzc
         tpb0Fe18I4nRgI9p8kCrpq5xqpSnHH8erlvdTwfInaO29HGCIzB8Zu+TqQJqN7clYjpQ
         aOB30orS7Dn9/EbD4dwLVf1fVDPAfJ87YjbZQB1AGociWrJGVJ3T/Gjs3oBdyFMuOXJU
         vCyHBS9AE9SiXrcsFxFAGYlCkMEvx1VU4gHIgl+Rvmjao+ahscH17dMyj357DbwdWtHV
         IJASIUmEXutuTmRi9ofrxsnNpB9EirqB/dHNKOzEkMr/pq3VbaBN762nZFk7ZyPxv714
         epWg==
X-Forwarded-Encrypted: i=1; AJvYcCXU8MiZbEi4E78QFkDefrXx/s1ttJ2YTWb4UfoNd+1QO8aQukdTEuBJ1Wp+RhND3xyAO+pehT9qTAgH5J49@vger.kernel.org
X-Gm-Message-State: AOJu0YziXNKDPrRTQU+SQufdzKcmHOXEDuoOMC7HHLIhqElmuwpbhFiY
	wSaAidilRRkl7EJ9Gs4dSCFd55QrTHaGgqTDB8UPomxmJ55HEpXF7Nm/olqhPEn9AXfyTk/DUij
	lgGzVIG3hoOFlAqJ1OPzIlDqnneyHJaTjpsH6JQ/QRUIaM4loKQtaKCL0+XzbMXUD
X-Gm-Gg: ASbGncsDTH2e8xyXQG5j0G6XGE8NL/+70QWKhHYjgTv7LJwh2Y8WcALw317JEU/5qbx
	ycXGpvXclUdeUwCK7zrjOdh7RedDg5Ss4YOUH5JwoAAcAEtI+fGuTfrhUiawVolFPOoYsPo5BR6
	GJVY0DUytEm4i9xA7AokUIVPBJSgIdJfnYekx2e04jnfk288tBFD6ZVhhVEYhA9hFfjJ/3X+l/m
	WMhc57InYyUhQwUxqYqjGF43FZyPJYRhK6pvqDUC0g0E+8Eva6MCKny4x/HXRq05J8p4c/BK7jd
	Tl6Ll2rrIy99O1K3uVhvIEKeCk8ug9MohTRZKiUBfQKqF5tVlta8yxxlzFAjy6sfr6H5eqREQqM
	/Pu0=
X-Received: by 2002:a05:620a:472c:b0:7c5:5229:2f13 with SMTP id af79cd13be357-7c5eda6705emr595364085a.36.1743077492411;
        Thu, 27 Mar 2025 05:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeMLOF3SRR+/JK1v5WXH3UPoYhZrVQwxUP2TxS6+d0GmaHHh//ffb7X6hJRB1//juZEaqQvA==
X-Received: by 2002:a05:620a:472c:b0:7c5:5229:2f13 with SMTP id af79cd13be357-7c5eda6705emr595356085a.36.1743077491790;
        Thu, 27 Mar 2025 05:11:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbbfasm2110837e87.130.2025.03.27.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:11:29 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v6 3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
Message-ID: <tbio4a5qzflhabnkwj6cezxfcyprrmoocmqevckdo7lt62ylxc@omujge3fs4ng>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-4-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-4-srinivas.kandagatla@linaro.org>
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e54075 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jJOvuocEYViH2poF1hkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9TgxqqZ99drp9jx7CRdL4OufKfy6LOcF
X-Proofpoint-GUID: 9TgxqqZ99drp9jx7CRdL4OufKfy6LOcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=492
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270084

On Thu, Mar 27, 2025 at 10:06:30AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Remove confusing and unused argument in swap_gnd_mic api, the second
> argument active is not really used, and always set to true in the mbhc
> drivers.
> 
> The callback itself is used to toggle the gnd_mic lines when a cross
> connection is detected by mbhc circuits, so there is no need of this
> argument.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
>  sound/soc/codecs/wcd-mbhc-v2.h | 2 +-
>  sound/soc/codecs/wcd937x.c     | 2 +-
>  sound/soc/codecs/wcd938x.c     | 2 +-
>  sound/soc/codecs/wcd939x.c     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

