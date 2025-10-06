Return-Path: <linux-arm-msm+bounces-76029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5ABBD98E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46CD64EBE15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D922B8AB;
	Mon,  6 Oct 2025 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drXkFUCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A873322D4C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745050; cv=none; b=W+kKbatkfznpc+1l3UljfVPVAgFxU0rm1qEQnIr1MJoFF2X+LlRD9YwWwyOcaKB3s/tZviLsU0dbl7gRN/WBNlA3y7yK0qZ7gnWEmZ3wJtRc4HgeuuU0t/wopOvcI3c3Pb5baBZY8VSItc+575h7I73L+bzXqXRIGwxYMoFQ+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745050; c=relaxed/simple;
	bh=yA3VOCeWJpMeFPPSvsnSB7GRPYFUREqE/fSTw/m8jVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM1LVVOvWJiqlXL9NgwEfxdWJ9wWU5SfRLpUVIu3lAo6tjg/R3Ssa+0ORmGtQKaXZypnVGB027GIhIrJQ/UFhjpKMbWn+jXNN6dik9AH+8252cVTwpVgZijjJ+y3nHkDpkmrulmsToExNlyXkrX9MQpFVIWV1bYSy7PFXJOcUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drXkFUCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5962jUhn017673
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ue1wSy69VigC+Md65Qg2LywO
	1m5qENAP2gsLG1UwtMM=; b=drXkFUCow2VacKOQ4WAGbx/LxgoMHcroSNSFsk9y
	v30uTWmoQjVE4w8Mj8et6SGkM9ozwO8jOlErLGhczGwaHwK8jBg2LU84Kwj4tmCt
	ZpOCvmUObqaZU6UwxneMf91ZUYLG31ts3+IOlUjt36IWeLDK0FmF+R27f66xJku5
	Pdq05yU/roFJcNbFhej6dnMitj10BLHaclknHrurzlHP/TwSLsTNJBuBFijSJJ0X
	gPFMURuMCxjnDHp7eFmOpi+HY5HfkNEFE1n2txJ/6Gy//Ooqni8m7F6T+AIFdB57
	CWL1RTf8x2Tx8JpCSiiwN1tLuNNrx5Xv1y1XZcvBVPS9Tg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6ufba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:04:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33826e101ecso6060394a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745046; x=1760349846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue1wSy69VigC+Md65Qg2LywO1m5qENAP2gsLG1UwtMM=;
        b=KT3qw+Hs6dfPOHJfC9B2r74n7659fq7PyixSn9AOBVPy+yt8Lowv45Wf5AEDIdaGPN
         FlqeNvG/Co7tB4/zSZeyXpoXok+VCIt/j2jfS5Ls8QwIhS0UO4ekldyjxNanlhW7uRVB
         BQSxbm0FCJx5n6SlXnmNJI8Gf6MCYvkzyrukB/YzUsCIj/oJdtytiiFyk6FKdE7BjRQ8
         sOS+RP/M1mJsLTgCFg9kesAAH1jc7mJo6Kg6bozN99cloLZFADv2HiQxtlEZltPzJAe4
         NjWTvgNNY1I1D1fgBBj0eZtdumXHf3VK5u84BMtVzAvm54llQRoWP8cz9f0ul8Ik/+0Y
         af/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY/HeXn3cwBkUiye+m877lcnZYYalALN2VJE1Vry6wNm2PqnIq9Ie1HtiH7VuOMuZYwwBEeDXcCsFVAa7D@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJWBF+vTehG1kyQ0mceZR4A2Ya/CrZdD/mmMVjCRUGn6fyT8o
	OMih20j3GLMHPTE1EOMRx0ucO/qqSUG1y+7RYaMtRVP9qMuixZ2DYfjVZ7VkPOObzFcORPwwrwc
	C43i9C8UhaV/MaYZp/tqG0ZGJ76dM2fGnPSjDLI1AcD5iYvI39HqaS1R97SGr2eP5CuzY
X-Gm-Gg: ASbGncsdiErqHZgnTm9O7eCHhS/xaWs05wUKsIZh3LpeGiyzspJYNhVTRIpVl7OLGDw
	fGX0acFBu9i5zntPIODArZFjJI34yxkJqWAmvmMsbkREoaXAbopqN1keFZ3ow90XPHg3+Lmfjxa
	yHLUE0dvRQQyIOcd5HfD+E679YRNsrEkQ2hLDo4c8xhlsrC9m4VRPN0yQ4nlJxv/wlg6aonZ6rk
	20w/xEqN6kxKoFfylXCO7PGFckbyIwJA7EzURKNWA4Pw6bM65ppIPpQsKebpeCKmT3/Q/0JsZlA
	y1mtX/7Y/De/9L+/shdy1nOQP2bs1iNXKsQa7q+N9fKrdIc1jIMJhJQHW+6GgVvsN7mPbhw1lGI
	KSVw=
X-Received: by 2002:a17:903:2c0e:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28e8d038b9cmr202072295ad.10.1759745046076;
        Mon, 06 Oct 2025 03:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXGuzsXDqH+HypDtrXeh1/naCIbPt2MMoelAPp09TjufTVxo08OD/KS48Pkf9lpBlURXi7ww==
X-Received: by 2002:a17:903:2c0e:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28e8d038b9cmr202071845ad.10.1759745045504;
        Mon, 06 Oct 2025 03:04:05 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d111931sm127803415ad.17.2025.10.06.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:04:05 -0700 (PDT)
Date: Mon, 6 Oct 2025 15:33:59 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <a7633abf-0005-423b-b152-e8c70aa5c27a@quicinc.com>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e39417 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kM1oLTEIhtBy5IrTauIA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l9y6f741V2s2gHfngGEZ2kro1iz_KLdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX82H5Z6i3VkWr
 OXDsdLb/zPA0ckA8XSer5gnpcfsldYw2FV7/6w6TlT1gzeD8wMey3cS1uCfrQzUQTfvzgkWbozz
 Jg0Fz9vfAoHiG5z4L0EvuqtnlzJhRZ0vZZOokVuolsCdZxsz0vddw/yO1iq4rh+1cX5PDJD9Did
 +9rOENwY4BWhTZkBlIse2CynSd48/Em+87+rkkaHnIH6rlHgraeT3j2YzP5kYnayR7sWNdhobRE
 qq11Qia0BgUgHnnI5kvukhbjNQ1I3pVboPDWN1OKS7I1PG9YGSJyvzQcU+kBFzduUMTRgbSBoxH
 fioLfUd2oSnHhQUx3tyCHHYbyTexIPiOXr7Citu+zwJ8JMO6f428W4ME5aJPHb9o4CEC7fgzkgW
 aeNMdnWDl4OPxnWTATZjJta9mMbUjA==
X-Proofpoint-ORIG-GUID: l9y6f741V2s2gHfngGEZ2kro1iz_KLdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On Mon, Oct 06, 2025 at 05:56:42PM +0900, Krzysztof Kozlowski wrote:
> On 06/10/2025 16:37, Hrishabh Rajput via B4 Relay wrote:
> > +
> > +static int __init gunyah_wdt_init(void)
> > +{
> > +	struct arm_smccc_res res;
> > +	struct watchdog_device *wdd;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> > +	if (np) {
> > +		of_node_put(np);
> > +		return -ENODEV;
> > +	}
> > +
> > +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> > +	if (np) {
> > +		of_node_put(np);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> > +	if (ret)
> > +		return -ENODEV;
> 
> No, your hypervisor driver (which you have) should start the module via
> adding platform/aux/something devices. Now you are running this on every
> machine, which is clearly wrong...
> 

This is a good point. Thanks for bringing it up. We don't have a
hypervisor glue driver (yet!) that can add an aux device. Based on v1
feedback, we would like to be a standalone module that can self discover
gunyah hypercall interface.

Currently this driver depends on ARCH_QCOM || COMPILE_TEST. So,
technically this can be built and loaded on all non-Qualcomm machines.

We can make the STATUS SMCC before looking for the other watchdog
devices and fail early.

Our Gunyah glue driver [1] do make SMCC call to establish that we
are actually a guest under Gunyah. Since our intention here is to
support watchdog on as many as platform as possible, it is better not to
tie this with glue driver and make it a stand alone and self discovery
module.

If this is not an acceptable solution (Please let us know), we can find other 
ways to limit it to only work on Qualcomm machines. For ex: Socinfo
platform device is added from SMEM driver which make it only probed on 
Qualcomm machines. We can look into this. 

Thanks,
Pavan


[1]
https://lore.kernel.org/all/20240222-gunyah-v17-4-1e9da6763d38@quicinc.com/ 

