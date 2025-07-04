Return-Path: <linux-arm-msm+bounces-63766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0EAF9992
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC434A7635
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5752E3707;
	Fri,  4 Jul 2025 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8Lixg3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291DE150997
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649624; cv=none; b=Yk018WWNeKeMf4obqZRoc9RBDL833LeDFrqUbA9GQ7Covz2hXNv9ef/alXlEmKd3z3Aj+ao24xNF8udhYoy6mxWDZDP90edByAinZfaVS6VP1b4ABbKF1DckxU7oSnlv7EUFIf/SU9Xo6N454SkR1JuE1qbT7ccSlc0stDAEz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649624; c=relaxed/simple;
	bh=Y+afNfEnr7ionJG6zDs8nJQjqBSEAWpeDKXJjf/L870=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5N/IdGic/tjCokh+h2lrFtixlPMSRT7ZLTQbp9JMBpDCazQuyTtHAsTOZqsKMDVZcjgvi2RZsav/P4bZVf8KVNX4rig6jVunclHhNQtQpjlRK/34OeDA3nTTZ7VXCsbSd0kwmA2b0Z5KReVwwzKz4k5oO4xkg3DIWJ/JolFgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8Lixg3w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQt2V011006
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 17:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K6S1+P0U6oPDZ1RZYx8X/1jb
	24SS1+osCF5MwjAfyHU=; b=Y8Lixg3w1CDKjxNMA/MgzrwXdW5HrWLeWAsbYsO9
	zQtdH9+ueb7JE8jCTTW1uA40jsbWnSK1jY9B0wVnauar+b9cfqJ3NA4ZhnHE2I9H
	69k9m7ykwed/WWc4m5G1uM5SymKIpsav+65DjNnWJf4Sakb279K57vurjJslmKDi
	I9K4rq47y7VMKN5ra6MyoSiuesh1YRggXa4BIqYv9acVT1Vf6Xly91WnRTRoKtHO
	5QnHCh0F25FEiMSKXx+nfcMBq6URkRmjQH7K/DGSL+UNi2q/PXLn3yaSB95MDdcm
	zrri+QL8ajsVBy7XrQz8BUw1D1T8mRG/oTHkv9ER6iDN/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w117f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 17:20:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so88554785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 10:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649611; x=1752254411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6S1+P0U6oPDZ1RZYx8X/1jb24SS1+osCF5MwjAfyHU=;
        b=rFK0TfZayYRmW9i0u8jVxMgWbEw3Fzpt2hlaCcwEReA/hxS0TW9SS5riHddm3cKdSI
         D1Are12JTvMgeDF7Tzl+7rofl/0S1EoXQnoeWEFJcVoUrMtKXcqNqez46kB7LoGD79sw
         DmfnFNL+nLsdMZHfxk/zwQHykXguoZx4avneBrAhs4r82EhgRHnUPZTEybrjZPBte9Kf
         uIlkx+yuEcBbMgJQQoAgUl4HEkkuvRz9jEpKUn1XzevPd1CDGR+tdv9Y0BvdZ90Uikef
         jTAgd1RCnxrhXIAgvJd2jJpFHE9vixfMxkfRxwOzBuM1NDfqWQ58z5WT04K4AoGhrCK5
         Tz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU88P2cht4zwBqASDgsiwW6UmCykGXVLMAeh0BYtY/vFDdMrOOU/1wxMOvKMyOvJFV2WtSioeRCaqNXE7VR@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnXmKIvwhirJ7a1HZ/+9+ETl3j7voQHJY/OrcxJ1pnYqM39a+
	ayK6nqpNAfmIHVsCGoYJbLOq/+QplpXgojR5qv6vdKregHvKJxuGzDMOYnGUa7NZ4qi/hYLxl5Y
	zatieoRyfbcrdP3i7vIZvkI6kZvAxHbG8QKSM7P4dkh9yfaEDcOOro9xlTSdXYzGtgoKc
X-Gm-Gg: ASbGncsfPUuXnpN1OMt+6zECiqOn1uXsg815nn+A8PTncjoALwR5HyhpocAA7E5+in8
	tFxSMtxhSX96bnza0uueUrzU5BQuUN46C2vdZVkqrUQ4FG0c3OFPffUs4ykgjPv/Q+EOo1O7lw0
	PKIlYLl1+bBhGtEqVRyfOUGUCE/ILgIcxZTZyLagu8ltmg9SZpbeOGqRjJosPjy+OIA+hTgJY/S
	7dxX6Qj0mwKVzb09VqVcuEt8DoWZytI8m1mDV0oijT224/XCcsuk5zR8EtM/TsDDfnPioSw0ksY
	3SU7g5onK7m+iPSgYFdDIg+yeRi84iy54S5ymLgcPOgG48AHRX1IHWMwgFHqgzBFuZnctBt5z9J
	xG0Co/2LXsybDvUSn20tbG+ATMhh5Q617LNk=
X-Received: by 2002:a05:620a:1a9e:b0:7d5:c2ba:bd4c with SMTP id af79cd13be357-7d5df16189cmr323257585a.27.1751649610708;
        Fri, 04 Jul 2025 10:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo/MlCYNc+2uOnhzse2QKjigyvirO7UV8XPRf1Nz4++jIkIKFLOYbvO9lLcaeerpkVmk5Ukw==
X-Received: by 2002:a05:620a:1a9e:b0:7d5:c2ba:bd4c with SMTP id af79cd13be357-7d5df16189cmr323253185a.27.1751649610205;
        Fri, 04 Jul 2025 10:20:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb3fdsm307083e87.44.2025.07.04.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:20:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:20:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: amitk@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs615: Enable TSENS support
 for QCS615 SoC
Message-ID: <zuczd27utiu562fexg2oemgydcbe3fs22mjeb26xiocreqlncy@5nqhixgcdhdm>
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
 <20250702082311.4123461-3-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702082311.4123461-3-quic_gkohli@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzMSBTYWx0ZWRfX3TibAsiJqtpz
 bPjeoZXSdLPYkjIgU6Ot53UwJi29K3mY868sdAZgtQwS+Jwhq2h37JN0eWt5YkGpKfXNmEv8LPK
 5kWj5KfWbPGwDICGRMNLqR/VTxV4Iy0jIothtmL9BmXUsRGEi7T0bjaIGd0jM2MyTBYlG2BWzjH
 TCgVuoQR59qenC4oTVnJv8xmNnyXqsDAngzT2MEFr070EYOdnvJ/YULN4zr2f1BdCVRRK4O0pu7
 xCS+Dx3HMwEDBfnqO92DHmEyvTrKsYGGxmFwuENxRYE81F+jooHbMvERuNT6CIY6DtBeHJvA4j0
 KIu41KIffoIBWVgHPOBxcvcXzcEaoXCMKTvbAKBHs4J6kCyHGlfEs0ximEk78/kNUGVW0j/v644
 fnQeI2UwJRYYIH85bx/a4IUI3YeMEqZ8OtuUngghgBfxBIsBeP4gsyLgo3y9MIU4/03BZmA3
X-Proofpoint-GUID: xklBcsaCyWGONqU47UOE3l-QraOdxoBP
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=68680d56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GSS0VzHe2Y3C4L18hMQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xklBcsaCyWGONqU47UOE3l-QraOdxoBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=716 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040131

On Wed, Jul 02, 2025 at 01:53:11PM +0530, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

