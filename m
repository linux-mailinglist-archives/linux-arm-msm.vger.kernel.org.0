Return-Path: <linux-arm-msm+bounces-59237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99947AC2899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF62F9E2228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1882A298249;
	Fri, 23 May 2025 17:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cI6R9VFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4922A1CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021264; cv=none; b=uppIgLZ9r9xdIDQu/tp77BoCKqj41bQPzzUwRRBLIfsWuf3c1FG49GUn8AJZOKlcxAX94u0ezOHRGGg2TcrhnrRhZH/Ngw9+d/LY49IPZ1SC8SalCnqKtybxjMhG+BBfwxobgFMP7SGToLXfrD5JdPA4iIyW+tlSThxiAw2Js5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021264; c=relaxed/simple;
	bh=UX9OZhcnhcNzoqUQz9+KX55OzNsT07DmDs9dne+IrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tT9cPiFLcsVCoFZdtzWmHiHsKol5m/ioRXMBiuIY6pAO27cHjOc3e1wM2Tacb8n0gQeb9rxyB0APMzofnztlylonyuSQgaV/o7oaut1W1Pr320MkI9Tj0r9pog+pNRdo4WtUu2Kr85j5Hxw6JsIGC9pAfcBk0x22rbKJZmOny5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cI6R9VFS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCtouq009837
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BVf8E7Hm0j7X/OZWTJXCmK0q
	4KOUyKl7xvwHfOg/+ZQ=; b=cI6R9VFS7p77NVjciGQsr62WTLBi9NhIpbe/t49O
	6RWfC2bamhuC3sE1aIxspGBb5vTebhyUmrkLdQuiaHnCn9Dq0e2E6GMD3VDXwsjJ
	6M7KsuNwcHDN8NUzFZI5o5rx10e4xoexn08LpLdHMOnr+N8q+MExfGPmpD3For5w
	duqCE5PKoPvehCiMl2vEEWmYd6Up3SMPMWPcHX5yZaVzv2qRAM3vX418qko7tWF9
	tv70jVPjAMRzssTadWp7j44WOKB84PuErxYTm128i6lRiTTLo1JZVApNgNbgOYdJ
	oEtp/ft4hpajzDcrd6Beae7kZCNDtvLSDTtOxZd++2oqJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbakxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:27:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e7922a1so8749685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021259; x=1748626059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVf8E7Hm0j7X/OZWTJXCmK0q4KOUyKl7xvwHfOg/+ZQ=;
        b=go4uwgFG2659giJzwXXr/uYP8+9RiudyohabjzCj4RTWiU4GgK/ZkwLbAPr2pB3sPk
         fPtjc1es81Q2ctVSuKk0oH8JJEzUPtRB6KGSPzmQirjRjm1B1LCH77bEHfhB8c1hDCdo
         gryWwir603oSU2YcKG1q0kfZl2gT8kyk0eOiRXGA57INXm7b7ZM7uFpT6pKP0xl3JSz1
         hiQBOxDg46ynAJ9C0nYgHV967TpELIlTbFFID653earGRMQBg0FmCYBBDce/aPM6cQPE
         Dg06pg/iWf6sSSWzT6/qTSHEfWB4LfivAGU+IfnXL0XzaEzocJBTO4sXPeJLf8qafXTk
         1TXw==
X-Forwarded-Encrypted: i=1; AJvYcCWFe5vrkwOx174KRrYqbUj8ONYkm/YKHA/piEPclaDWvimgGbBrlQ8eMRMZGlGhmKoZvj7ER/hw4njTCED+@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkWUBMFEaBAA2Id0/Ylzoq8pPnvoqVrkY2iyALgVZKbi0+eY+
	gW4acxEtuoQ8se9O7LwHlbXVmrecTeU5LFJsIDj2F5C94PQZg5wEGWvXTu9NJ0tyYb2Jbm2pYxH
	7tSkR6Jcy0QzuwXSlKSCHQ7cMOlFk1dfwi25jRt+99vyndeccVOS5Ih7PE0F3+0s/knJQ
X-Gm-Gg: ASbGnctoaa071JrfRr+s+kLiXKKJg699kRBT3hcCEAvCVDJklYV9iliS8sssU22b5Rj
	j8LiHnaRWu7dR5+PZ07lJfA94H8w0ABidgkFikisJShqNjVNOa9EyfOjheJBDlFhhhw4HCfQLOv
	3VatFrdFm8fwTb1oCrdR90BY/NL6IZb1Jv48ol+lWvpR+2wzsdrtpMe/El8IjHzWkzNC2RJn3gg
	VvaO1+mhjoU4nTXoC6yVGAao6Mo4Js11rI5nWoKhzEIbXhbFQcxehQiPTP2Y5csAS57Ba+INJUi
	RdU7Wzfh2zzF8R2wD8+p4hf070imc4nBDTPVvDiIEMvrY8xsBnCztuiGD46svDazRkFBgjV3nyw
	=
X-Received: by 2002:a05:620a:2416:b0:7c5:405e:e88f with SMTP id af79cd13be357-7ceecbd70d0mr10151085a.21.1748021258980;
        Fri, 23 May 2025 10:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4v4FFYt2KJcqNPAHKwwKQS5uP0VM4a7TB6GLuNQGEXytudQve/yAzT3dTU2seJ6C3/uT+A==
X-Received: by 2002:a05:620a:2416:b0:7c5:405e:e88f with SMTP id af79cd13be357-7ceecbd70d0mr10147185a.21.1748021258637;
        Fri, 23 May 2025 10:27:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280d820443sm35986171fa.7.2025.05.23.10.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:27:37 -0700 (PDT)
Date: Fri, 23 May 2025 20:27:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
Message-ID: <wbpucxl3kf7kmob6bbhexivtgrsn5ehgh7zfuebx2vxjcg46ws@gfhdgi7yd24o>
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
X-Proofpoint-ORIG-GUID: s5po9XF6j4JyVtJokDkUlAmwC-onrcFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfX8AefLtGhw3tS
 Qtk+4C88rl+m1xchHFP2Q61Gwk17EYNAOiPYwL4DkdKudEvE4NmCS52z1MlWU0JBUlGZflbhJjW
 A6njjgKRBoyog0aMt0HZFhdZOK0akq4ByBJFnpmZIebQ+weX9tbPUrxoXmuOMGc9+VkEGj/MTV9
 XTS2Gl+2cS6zfYzgh5rdKQTee+M7aGbPBFpJfeK8b10c0jqGyB1yFKTeDmRVdyvpJkDUJiHSjgO
 AzI2VN9gjNXfnw2ixypu25A3rpTzLQGM9Zf6RcCFy8nUxN4xogYpQD+tL/h4Zv+/8Zu6gBa3jIL
 VLX7HK8IrIPQFq1hlMzlOYkfdE/q4vne6omyzoRTTEuL2ASNs6vv9QXi7qMLwO9x9JmIRaLAan5
 jfoqBVdx7w+sgs/DIh5cEOO9NB4yHTOuVJy+exb/VqxXehmKS8mL81PoimM5QBOFf3bvBs5w
X-Proofpoint-GUID: s5po9XF6j4JyVtJokDkUlAmwC-onrcFL
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830b00b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZT9l893yBoyBf-nb0IA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230159

On Fri, May 23, 2025 at 10:53:17AM +0200, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soundwire/qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

