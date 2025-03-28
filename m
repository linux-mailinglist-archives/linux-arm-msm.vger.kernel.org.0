Return-Path: <linux-arm-msm+bounces-52763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 184F8A74A05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 13:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4597172B0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCE870808;
	Fri, 28 Mar 2025 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blnYZH+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E14B12B71
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165937; cv=none; b=P1HDy64CT1aCMh2T8Hn+PgifEu7svwwHrIfoxWOuBNHlBtXIX0V+qoqTTmcplL0rUyZLWVoWcWxd6zg00JXNfTDNIBWIFFmbrDo4c0ySZQLLJHn5ajJjs381DZ4hPB1nCqKcIUW/NKzohrbOCYDSEw/dQwQ6X6r20Oy16fTfkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165937; c=relaxed/simple;
	bh=ZDj9EWZcyiHklTiN3aF6Il1wzX64rcYAEdXgYzD2WKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Af/CIGRxcuwgFB2kHsOy1uW/AWcVrUBJeg9Hb+rwnVWVijTYXAvfeR3RNi+djdWySexybdXeVT2tx6stQfRf1ICuqjXE/XQfwCdZRDY7eDRsAo5ftbaxPcrC4JzlE00dHx5aroHN16/YDjynbCMdxjAGnj7kjJDbOo34FH1o1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blnYZH+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S856iI011176
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZvDweKJ9jTquauiqzG4b1vQJ
	jhiOyV8IbduQk2WD+80=; b=blnYZH+h7EjirwAzcI4rQ32cFhE+R+dQR+LBH9aO
	2eGnXcQlP/4wesPahwAB1U2VKXUr8HjJsyyLxVuEs6cOQzQWCHcAq+MbpX35wIB3
	TFRsOpUfKg17qbB/6ot88MRyPrZ4VNlfa7alYOS0pcIpa/vOJzG5LXOT21+oB9PC
	Jzmy/zxyo2OkYViVK2xfWTgux19RNXeAmxyRHGvYCGbBea/gO0dUKBiWrv5YHvgq
	/5iLFn9HMP8LQN8iRFkZmunDXcGt/jfugSokcNQSUEshyYKjn4o9o8jABM+OP7VG
	6+wu7iLAm6VvBOXHG6RqbQVb6jXIiSPvryTu9z02LzNJfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxuguch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:45:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c5e92d41so329549885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 05:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165933; x=1743770733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvDweKJ9jTquauiqzG4b1vQJjhiOyV8IbduQk2WD+80=;
        b=n6xoBQOpvOTUNLsXNPQt5AUKFoJrS9htJwl02eTsTYN70tVQtOvhbgoiLeRCWMlmxK
         9Bs+JT7BtqkLNVfidR1vTUraeROobw73XBnoPQHfxsiz+c63Lwpjx4lAiG/CyUwiuAwc
         l//0mjdOW8d6fXsLoyZV+51KQ52f6M5YDFHkIwoJLMq0Nzg/vF4yQCw5FjG2CUeT1eyV
         DwUO3/5H2w4ARENVKHSyuqHsXeAV7gfo8OkGT32WMW32GQ6g9UE/pm9Gehz9LvZXzaHz
         a99GZl2puHvqtWEtUgSu2x/Zl0kHv1SHVaqFUMMgZttUFhIbhxo65BcxnBq3/UHm2k3e
         Tf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWq7wT7RHglXMVNeZOtyBmCnXd0OA+oQJ5Sfv4xANtPeZeEkAa+B7V8dbXFFYUbTdVuB7SYUn7L12KCr0vH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Ecb6zCPCebHmAvfFa8ZSk02EQMAzyaXL1av+MNtcdtQWqq/5
	8UCMfCXZkj8gVmsIvpjsQdwEdfu+HMgQjBsFoWt+eQ4O6KAQPP7xMW/h7kK4fnmq8RJWgoqQchz
	fU3x6H5gCapsXeXPig3txHXoYamY1XzoT+c3oW0t89EMgrzkGN+P4CXLny05rteI74eY3uTDT
X-Gm-Gg: ASbGncu6D0M/uVLoECuoLtn+6/BHTCpmm5IpxdmCvNeXph9MEZS75m6uSdnsTT8AAnW
	G5xBCTsV83GTBKfUHiwz8UK6eHXBd0dXdxUmHbuY2JoTG+xQIMr0IKQCgFE5wa306w+awEIT100
	/jSpT4otgSUlCAavSq5Ws1/PXkN8z4c5kk1pmniLzRpe4zLLpP4jTa+H+BAKVhQBBbkF3RPQT5Q
	3thRMiW/gAo5ryP8V1UnCSVWarUN+7cOM+MPsKjhrPRFo5uCSWljmhE91I9TIg90650ZbyeKOaZ
	dSbUHGFFVLpWajET76d7sr5Al3p95AFVF/w4cU49k56UOgW8c0O/q4u82bGIK0CqIx5TE6F4k55
	OeOo=
X-Received: by 2002:a05:620a:4256:b0:7c5:5d9b:b626 with SMTP id af79cd13be357-7c5eda60393mr1455860285a.36.1743165933087;
        Fri, 28 Mar 2025 05:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjKaK0W01377SicHB6sGo3m+FuXvOv4Bo+AmDgxKUrLAkFj22Hu7JKxWtiIehA4px01G9TUw==
X-Received: by 2002:a05:620a:4256:b0:7c5:5d9b:b626 with SMTP id af79cd13be357-7c5eda60393mr1455852085a.36.1743165932495;
        Fri, 28 Mar 2025 05:45:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4c84esm3553171fa.77.2025.03.28.05.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:45:31 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:45:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <zzcd4pv7laryb2c5wkuwrhj2ih3lciqgxfyefj4qmi5clxftbi@ykpy42anl4jm>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
X-Proofpoint-ORIG-GUID: TgoMEXgi1I4-ZK8BUaqINrEBLO5ODgNJ
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e699ef cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6YaBRE2yWWFYFR57820A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TgoMEXgi1I4-ZK8BUaqINrEBLO5ODgNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=757 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280088

On Fri, Mar 28, 2025 at 03:13:57PM +0530, Ayushi Makhija wrote:
> > These both above commented from Dmitry I have addressed in the version 2 of patch 7 of the series.
> > I have squash patch 8 into patch 7 of version 1 into patch 7 of version 2 of the series.
> > 
> > 
> > Thanks,
> > Ayushi
> 
> Hi Krzysztof,
> 
> I hope this message finds you well. I wanted to follow up on the reply I sent. Your feedback is invaluable to us, and we would greatly appreciate any further insights or comments you might have.
> 

Granted the lack of response, please make sure that you've addressed all
the comments and proceed with the next iteration of the patchset.

-- 
With best wishes
Dmitry

