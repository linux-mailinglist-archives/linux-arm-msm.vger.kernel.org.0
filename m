Return-Path: <linux-arm-msm+bounces-60133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A843FACC4A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5149D16B077
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C38622B8B0;
	Tue,  3 Jun 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQ6o68R2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066318FDBE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947850; cv=none; b=QtVr84X1S/+ZNpM+D7Hb6qPloTcsk8eFd1qZUv3eBTkUyt+4GPy2aDm5cHZvAF18KtDU3TvRbcSU8x30LW+3mLEOd/X0uVvsHByQjGFEi9QMo2DYVq6aEeqIecIw3FAnfvAFBeONgRDp0aTtksJLVXaWX5aqaFRkueA2bBvmdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947850; c=relaxed/simple;
	bh=RzXQoeY8OBWNIwxdR6qtplFIQ/IFmhyVe8iUNlNmbNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jauAs3225YRaFUrV//VXaMcHh76BQSHuvyp2S7m6hl8DntCp4bffIDUZ8RPlqB6tpD/47M4xgUfnnHSzecVeIzLOhWm3m7I4z0dGe0cCjUb97BaOQobygZdPuDJl95lu1lCj5IawAYpGSYgo12JF/4VErSNMH1/zQNl3wvuF3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQ6o68R2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JxXI005909
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 10:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vm4mnfktEosvn9wSbQ9LX58d
	m00u7H1ye4NwgmSgVjI=; b=BQ6o68R2EVlEg4rFOgwuwxSoiRjVBsRq27wya4JW
	YKU9gIg4ALQHg+OKo7go6U2oh3N6+7vwwOWR3XVI9pQxFp/RE4wUPleaq4u/ycYD
	czm/qWHttrhfiFbssW1TBhHUEWuJVkfSSd0w4CCyJ6UpSg/JDFjmdPT39WNRU/aF
	o45ZM3QGESGbAmUN6W9s84k5OHyh0Fw7SnDc2TUOaLyVEzhHPvgWrer9dUEjHZ/p
	/1S0U5fD0xiQ5mtSCFzNhdg4iAUfCOrgkdYCY8yFY/j9eYTECDz26vg1/Nkes8KN
	eivAkNnVG9TBxK5z6xtW5srrzIgjmBAJKOhcOiWkRtl6SA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471wqwgc4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 10:50:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caef20a527so1418863985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947845; x=1749552645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm4mnfktEosvn9wSbQ9LX58dm00u7H1ye4NwgmSgVjI=;
        b=LIRUAk8IDnzQ7zL3yv0rGN1V0HRfWhKokZPFUmxdtad5KWBUueL9NEQxBhSo/mw+u4
         MTc9cMy110BYzFjZHyb9JBQ3TRXxY7hyX2Ng1Z1dgnBFfPyF7hstoxBCsPmS7K4PGYhS
         CKcj1D9+C2Ua78oRHgOW2Gf/Gv9C/Mf4ZXLgwCzPMy0hHeVEel7Wlc/suQl41uALHBmr
         aK8TRxkd9t5uvnCJvBl153bxNnZsC0gVweJi5eXnOeO8nxkDJJIteiE90R+EgWQEW0+R
         bPGXnoTPOZhnjputFed3YtIJmdaNj+X2p8g4/4alPw+GF1JMGpdBcBmnBr9S6JNXSsfb
         Ts7g==
X-Forwarded-Encrypted: i=1; AJvYcCUXY66JaMp1ovn/eMWdkpBX2vx9mBY1AFE75qGLTFDBOcuxPp7gRBDeRLd90QLbAr40wN+nLfFamcPQ1fvm@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKOZAfaHCHK7JExkmuOmv9bGqbyfDV1/5m/t0+2HBsN8JGlN+
	MvOTd+Da7qc0jp58E1o1Q2w97v1PbDQd+ULso5erGnNnfNYRF+xaI5VtKMSeSd5P4JgwWpd16+P
	sWGI9pfcWb52L7pbTjuGH/yhsHDmyK5hdzYUT3jGNNtKrsSkPOL7jcnxNaKw0SG7XYTkG
X-Gm-Gg: ASbGncvG7YQBnMc7yel/IxxqTNyiB3cc27ja1KV4O7WamKO1Z3fXa3km0d/wog+MqVk
	cS7Kb3LNVvJZShqiTGGKOOvc8VwPP2OJnvoQAqTO2zMPvGlceVypKMTPpSMk+i6647Db3yfETma
	N3h5y0BKdOr/0AI8mgnaPSmLwWWAXEJaT03M44pfAAUgq7YVOc/0bO2VMMNi7RrOTew7622iQ61
	QPtv+ZvJcy6WTaHMCosUQbhfQX+s70KRlZFy8+JL3P+dEutcI6B2Zm3kN4lrKmao7wjZuYE10ix
	cXU5j8HGvfjCHtTSNI4gcwQnJ3/eFHsLJWI2bybWDaCaJWa4ZSssA8dGMi1t3XpilYUOzNm2R78
	=
X-Received: by 2002:a05:620a:1a83:b0:7c7:b60f:ebd8 with SMTP id af79cd13be357-7d0a4af321emr2309211385a.24.1748947845577;
        Tue, 03 Jun 2025 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6/Ai8VNOZ5j/lNeuLKY2LQit0DXGz1yVy635bM9pzD1rNIoOXopJpQt0KqrADunHS/Py7IQ==
X-Received: by 2002:a05:620a:1a83:b0:7c7:b60f:ebd8 with SMTP id af79cd13be357-7d0a4af321emr2309207385a.24.1748947845077;
        Tue, 03 Jun 2025 03:50:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85a30c9esm18242121fa.0.2025.06.03.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:50:44 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:50:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2
 shutdown when required
Message-ID: <i6xy6b2seaxkrpktpyh32fqyxctcvvpk2u6ptpjs727n5fnlak@jcvlqg3ooaxg>
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <0nJRx6-RgYybx3jhgUDcxC9hIxr02feRJuYYgLa6lpO3DOSuQidQkRKKoqvQoV0x26UVeiV6G5XN8cMTZ9Ol5g==@protonmail.internalid>
 <20250528235026.4171109-2-anjelique.melendez@oss.qualcomm.com>
 <895a0004-04df-4b7e-9855-bc0033ca650b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <895a0004-04df-4b7e-9855-bc0033ca650b@linaro.org>
X-Proofpoint-GUID: xwvcMNSiZsUV0IfjM1iUO82YS3Fbq5Vi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NSBTYWx0ZWRfX3d/N0rcwSxBG
 eMljNsWO6gnHiFX4GtlM7bar8QT8zPLsu67YMOs5kVhr75lcL/LPJYnYm+SwB8f4QLvj8mlJI9h
 FMfR3W3x66z8xXlgVXzTv+CkKv2NMWhiJVMZgNRXVD9MDj7uwmwJCWprOW19l5CPoZLwgZu+L3O
 ve8njv5EsORSNHJ2BjnttJp2e1JFR5Th3ML0IRmUgRy6BBUGWmIvA8HmCdXh7qkWCC5uchQGFTa
 GKbf+GHJMZdn+9TQJfGhYSjmI8DTgRNEiKQiJCrkfiKWhZE6xMzmCj85XXslmnsxwMOEeVhiLyg
 ll6P+wEo7O94zLzg2JqpHagq92275C3OuxfGMG237Fss5jRac6f8T7YC+tpD7VRrI85nhQnEeyC
 PH4Dw4pChoJviUD0wUo9Fqj71ejT1GU49+fxIsSzMSAvMHqvf3biF9v+/6bxQeEoufygs+fE
X-Proofpoint-ORIG-GUID: xwvcMNSiZsUV0IfjM1iUO82YS3Fbq5Vi
X-Authority-Analysis: v=2.4 cv=ZfQdNtVA c=1 sm=1 tr=0 ts=683ed386 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7P3EZGi6tQuJdicK0tQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030095

On Thu, May 29, 2025 at 11:34:27AM +0100, Bryan O'Donoghue wrote:
> On 29/05/2025 00:50, Anjelique Melendez wrote:
> > From: David Collins <david.collins@oss.qualcomm.com>
> > 
> > Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> > stage 2 automatic PMIC partial shutdown to be enabled in order to
> 
> stage 2 should be hyphenated to stage-2
> 
> > avoid repeated faults in the event of reaching over-temperature
> > stage 3.  Modify the stage 2 shutdown control logic to ensure that
> > stage 2 shutdown is enabled on all affected PMICs.  Read the
> > digital major and minor revision registers to identify these
> > PMICs.
> > 
> > Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> > Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > ---
> >   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
> >   1 file changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > index a81e7d6e865f..47248a843591 100644
> > --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> >    * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Should have the year in it.

Not per the new policy...

> 
> grep -r Copyright * | grep Qualcomm
> 
> >    */
> > 
> >   #include <linux/bitops.h>

-- 
With best wishes
Dmitry

