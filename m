Return-Path: <linux-arm-msm+bounces-76259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7DBC283B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 21:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 864C534E74F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 19:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A7E22A1D4;
	Tue,  7 Oct 2025 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmJZvMEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE7C8E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759865705; cv=none; b=h5viTydfRTa1aiJFR2GL/xP1xvIBSAh4FXLwuXdwtK4Sm9N99nSaCXbIkSmEH5WP5p5MgL6j9KZD2emssYD0juKZTHxQgfxjrAv+D3629z0C5XGOP+4YnoQwUmdSn/IjdJ1zpVcmJiccOus2Ngr+4H+XIeBCe+5sA6up1x55wK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759865705; c=relaxed/simple;
	bh=wig0ZZyUy6dvUMp7li1+6/VNLVxhlEr3/MEMi8fh3UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nl0KLZZ3G9wlTWDkpPSdkfPqNCZNU933a9bxuWrmJZojmkyngbjeXaUrZmlF5fLqM2ygODHUNKVlNsJjaEw5r9TlLCJZ0d1M9DO/qJqXrdyrSL6MSIesiQf9GfjBAsxMuNHlKQFvOKXjqvrlYLI5HbjBaYLTlqcl9Ow+P+TXqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmJZvMEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET4kL000415
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 19:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=PvaVJoAJ0Gijus/RZwgfHF8MqLW4IcqzozVAjzVGhEY=; b=Cm
	JZvMEajRwKNXGpNzosoJA4NQn9MIt49ruOyIEiOYpZ49RItE9q+KLKVaJFarenxE
	kQh24oSfGoqFqCqXL2OqOtmAC1P7+CNQOjFABtnMnlrU5tiqLcP7Q7AC2Pg0Ujee
	7poRyDgBTODUA21HLgsZ6nE3T9sgw7n0X5kTO0JwEUEXzm4ZojfeVtte8Y/XsvNG
	hJpIJAKNyVe78VfDu1cr1ijKo0NOEnuYW9Ms46JlDLat01uvFndudxCGEpmz4Rs4
	QHXaWzuKYDvYw/ZgNHv2H89lyaijdO/eRqpYqIFO0gggzSWHgLywuYpPHg4S+Dm0
	Fr87B4pzsF0ChIloT31w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgre2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 19:35:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d8b8c3591fso184146311cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 12:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759865701; x=1760470501;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvaVJoAJ0Gijus/RZwgfHF8MqLW4IcqzozVAjzVGhEY=;
        b=u2Fn7uEqj9YI4lvyXfqaXqd9w57FJZggN31avHFnrDskFtN1QxtD7TZuRglmS7ANa2
         QqtgovsqAC0KAU4aCH8E1OpbmebwLqgAF4uY3e9BlBxZJRbeuDT0XDIOWnNtqb0udzoM
         KCEuJT4OXFClINqVpaT8CNZK88SLqb7erPst8yh6OMAK0uHCcAE07RIvd1Wv2nGYpI/q
         ok2yIHNo/bKwAcL94BN2cSfd4MyzH+I4EaPCPh8dL8kVlNREm9eaUf/E7THMfGh3tR0I
         MLwg/C0Ob5TyL3s4Zk0WW4Qb3N/U4BHP0U6AYO6Kf/HtIcIaXeX5vojrhlzQlpJrGC63
         iU8A==
X-Gm-Message-State: AOJu0YybqmsgzFUpLpDBI/EHekVPW/vmYePKMQU1vMPo+mXmhpHuOupj
	GINmohuz2EgwdQdLNnlp5ypQjALT+YWdKDuizueFTt4wuLcsDONLNDjgQCtMNLhhau1Wgz5YmKc
	LiGK09p0Tv/Hw2o/nzcVGNwkB21jYLLNd2nQzC7H+E/5Of42fh7Qbm0txXgTjPfxokvG2
X-Gm-Gg: ASbGncuEMOeE0G+hTZuzChefbEwH4m0DiSjqqHRPUI2nRF7GVkg4tVMA7P6urCgArIH
	qgS2BHs0Wqt26JzlsYZHyDj23EXiXWt5fx5WVULIwmRUL/tS4Mc32I3Im23ymf9tO8TPkH9Joj4
	ccyRmTWuN6lrW0suiOAZWVdyAzJ72UoOEskji5gEPjGebEzwgpyk4N5SjhFRVuQNGpn4vGZZy0c
	28xSZ8H/lLXla321HUIafHhTwCnWkO3VERxaQ4BQhnypnBx5X3nF8i/izHgzbMe0K9Z2AQycsoC
	bFLa7IlYgn987ixpYax6Ft4qgGtXCgYYdMyalc6nQJotOuQGX//b+KwRUTEdq3plwfTne9UEgth
	okGZywGBzIfnKosVfp+IDFL0GZ7BKuBzai5o25kvMFxFwgBLCbg/sXgjlkw==
X-Received: by 2002:a05:622a:554:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4e6ead771bemr10781181cf.41.1759865701213;
        Tue, 07 Oct 2025 12:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhYB5jrIhIsoEiveBcI1+5csRppnfeSgR0nJsMQlBnsHGl4MPh8xoRA6HHDibeJe3352O9Qg==
X-Received: by 2002:a05:622a:554:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4e6ead771bemr10780851cf.41.1759865700740;
        Tue, 07 Oct 2025 12:35:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d3e6sm6348563e87.63.2025.10.07.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:34:59 -0700 (PDT)
Date: Tue, 7 Oct 2025 22:34:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: media: qcom: iris: crashes on SM8250 / RB5 board
Message-ID: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX2KQTVORPnn07
 d0S2yYYYxVrjKHRTxzzuwHYfQ4DKicWjZkIARmk/eczP4GznHkHYQHVXwFZvzwJxpGk1eGoGDON
 J+KVzaX6tP1gNiK3ofXtpGhhHoQMzSNfyDGX/8oTgszvTvP3ztjAn1q7guInEtwRjYnC3qfDqnd
 vT04OJN6wlGPme1yqth8Htp3qdYG0EZGPXs1H0yfgsZCa1dxXk7J06uvY5b21YNMutBJ8HuWlrO
 JiuEcTfOx2OI3nR/l84J7HstzD3hfSs9xjUbzqLvcJLBAjwBLoaNWrErXDxqfjM7IX8/2AQVFES
 Wl6Eet8eYGTczzfS4ixuED68B+iOXGdjjbRwTX1Z77jgEm/DDUa66aD6GR5q8vO/7iRcc54PnLH
 7GfsEkAGQwbekg+MoA4b8T0GOQRnHw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e56b66 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=fREZMqYHaUzqRmr5ttQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: IE0PMpCDuHKqU1le7dTlrf0DzKy1wMpp
X-Proofpoint-ORIG-GUID: IE0PMpCDuHKqU1le7dTlrf0DzKy1wMpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

Hello,

I've tried running fluster testsuite against the Iris driver on the
Qualcomm Robotics RB5 (QRB5165 / SM8250) and I noticed several
instabilities:

The following VP9 tests cause the board to reset badly:

            vp90-2-05-resize.ivf
            vp90-2-18-resize.ivf
            vp90-2-21-resize_inter_640x360_5_1-2.webm
            vp90-2-21-resize_inter_640x360_5_3-4.webm
            vp90-2-21-resize_inter_640x360_7_1-2.webm
            vp90-2-21-resize_inter_640x360_7_3-4.webm

Testing H.265 with JCT-VC-HEVC_V1 passes with -j 1, but quickly resets
the board with 8 paralell jobs (the fluster's default on that device).

Neither H.265 nor VP9 testsuites crash if I use Venus driver.

-- 
With best wishes
Dmitry

