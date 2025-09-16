Return-Path: <linux-arm-msm+bounces-73749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5EB59BCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC7B3A4DFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6A233EB06;
	Tue, 16 Sep 2025 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL73Uz32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5F313267
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035507; cv=none; b=lvVovSSXyjRjsTNZqCTUUuIbkqVN8kroWOXHwiI2w57Zkp/ytfD6bNzaCk9xI71C/HNQYKM+zKmemYUjnqH+72cAhimD4ly/Z0T8DsIFvReHlzO7ChhauxreIF1PrLh8N6xIOvLfV2ZzSZVQj7R0BkA6flw+sfc0qLk/zl1VedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035507; c=relaxed/simple;
	bh=t7UUwd4xgMft90yTMEDkSkQCO8HRauBhf0Zx0laARP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/idK73Tp+XlTSe/2Rl5k9/Kon+IjhRcNjxkAUxewK77xj1Jj/8YID9yizAChhS4FzCUManw0i5I9SrsvuZ7LL1vANRcLqZ5t9vVDnWBKLtnpoDjAjdNKqgOK8Y+x4BB2ZJgR2l+18pBVtiiBOuRFvpuH6iKmRqdGJPeeSwyZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL73Uz32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GACeWJ005054
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TNby5qq49hfo4o9k//m3Xyh7
	0OtDv47+M1YG9MtLCxg=; b=JL73Uz322hjo7db1y8VK6MOqpZS/kNSXyhblTxji
	X/8ett4qqsRTgS904srclOUiORO9cUQ6fCNQAdqVvbcsd/FpA1QncRkBfd94o/9A
	ayIVhYJNJflxOOTiId6jWan/mBB5kLQNYuopyYXUUqOWrhXA8sAyxX78F0XvlXJG
	pHHv0lRCGDuOZLzhNvBwVoJrRRHia2ITx3ocbJdXEAH7TxVOXS2Ot2X3WxnxRsKs
	w1eOZm7vGwK6MbzBwazgwh3l3yTmEKfroCsKUCamZGZk1e5bGDicRtqDY167Q7ag
	Hs+kbQDaAo6941gLLkSbxgZDV1ZTBANlxA4/IP/V80SL4Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u5983y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:11:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-8dea7ed2763so318804241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035503; x=1758640303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNby5qq49hfo4o9k//m3Xyh70OtDv47+M1YG9MtLCxg=;
        b=KyuKz9fpu383GNq+PoLWGBx1z45yxnCXYNJqI9X0Phg3+9NLC9Xn0lSey7nDyGbc7k
         /MQJrAZW/3eJTUONWork5/GKhBmreuopb7Of2CuFHttU0WIOn5K8YPhH95AJy5Y1MsPY
         uTCjhIwxKjU6gD4UT39Y4h8LNUTAati5lb0cPOpO04MUU62MqS5B1Sw2Bq7BQQMvlDP5
         JrGzxdHWWhowGUJdWuHY0lADAs68hFaaxX+ggJUUfxNHB63JNW/QJOwMWdS1EphiqR/0
         HwmKL0dEki8+G6KJc92Qi0iuUgcQsoQldaMW8bCm+e2zdqfm9Le9/M5nLBfxYfXggCYl
         6shg==
X-Forwarded-Encrypted: i=1; AJvYcCUPbczXnEjsrC2/gPVGLyuQjSELr71GutK4OMN9gT4f/1xBhk4/IRZ0i2uEV/xKIt681nyDaTt2mSWO6s0j@vger.kernel.org
X-Gm-Message-State: AOJu0YzaWhI3MHTnaCACzchJ+l6uFl2SB+dAh6wlriM8kR5qPWMGRRbQ
	LCBp6m1GZenvF7d2ifoncSgZBJmz+JCCVsSEUsdAloErf1o4ToGnJkS/cP+gJAL/+wyHhPBf/sT
	6koWMkM7TAv2qXxHRvA14UdFMvGdEfkBxmmjG8132uV/Ts4hrAcXDLdg3KtyVJvvMwcM6
X-Gm-Gg: ASbGncudAxNh6zlk3+2VcEJYi1opxaivQj1IjOoPBbP2/T9j/HgPnit4Sg2JEQsfTHw
	PQiqbEpVJu+SYog0rSWarngMqfPwFpzVZDjB+y5psKkLcD0MdtaCTu62liNhv6XSY3Gt8YRmuSF
	lfnmz2W3lhw4c8P7JkmnmHRQZewjhFZ/XS7S3MVw5b11c+2Ziw4e5I0sEU23nz7r1CUVd0xsMrd
	PvXJA5DeTCISQjHI50oR3uYVN5J7RaVTdFgx0OW8dsWrJXcgTqaRiPCyN9dWDEJj5WOLa3xG7oP
	J8YEL4vv0H2IvCeu7vb1WC4St/VVNfJd3DHOVBZGIiPyx9b6Fm9vI+7IvIcChirAxwvdyz91Ykf
	ITo5Us908BZEUsBHWjUu5KK37QR85pY4d/bbOZBmN3YlBs3TgDHGS
X-Received: by 2002:a05:6122:3bcd:b0:538:d49b:719 with SMTP id 71dfb90a1353d-54a16b2c285mr4799740e0c.1.1758035503235;
        Tue, 16 Sep 2025 08:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjpODeFy3ymdDzfM3pALWwp0engqNOO0v2fjb8KygHwUWmCU8dovGzcM73w2iuBtRoo/d/ZQ==
X-Received: by 2002:a05:6122:3bcd:b0:538:d49b:719 with SMTP id 71dfb90a1353d-54a16b2c285mr4799705e0c.1.1758035502721;
        Tue, 16 Sep 2025 08:11:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-35828d19a04sm15474721fa.9.2025.09.16.08.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:11:41 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:11:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v6 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <pwnt6obqsyq3o2qzqk5fcydzlhwv7ycmywvdeo5pwhvt6kbw35@ce36yjyo3hp4>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v6-2-62e6a9018df4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v6-2-62e6a9018df4@oss.qualcomm.com>
X-Proofpoint-GUID: Lh1j5NSDJUWgVj5PLun0wcF6s9sv1f9m
X-Proofpoint-ORIG-GUID: Lh1j5NSDJUWgVj5PLun0wcF6s9sv1f9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX4hkUWeUa5X9E
 8iCz4b0Rgrw6FKbyv2KxKvlKF2iCscgvsu9D1/g59WlRHZ2W1jm/aZPQPyTHu+w8oJSQ7Xl7dse
 Lmw9vF4l9k9lwKFlvElOmTpVMmjQ3WLCeU1ZCONNhL42ARk7IEJZOWLfP2Ymsh+O06eB6bfIN8e
 03mKw3cUbEBWeYgaL61vzlVLOMs9bB+OThi7LI4z2WX7NA+WSyY6UhAOu02vdADYEVHzoDFprWH
 +lKeG9L3sUTnLgABJu0SCyZ8xM9/49/xri6HsFx+W7M6K5LPxGszS5/cNJmSWJ3rUoOM7oQAaDC
 YzJzxiUxBAJcahPk/pOey9/U7xuoNcXYzNcvLT2rxIPl8KMhxiUQgCgDo+JPOcQjbLK9slJG0/Z
 snrqwCIG
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c97e31 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lcEb1VsSqg0gz2oZhFQA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Tue, Sep 16, 2025 at 08:29:24PM +0530, Wasim Nazir wrote:
> From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 
> Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> DMA and peripheral communication on the Lemans EVK platform.
> 
> qupv3_id_0 is used for I2C, SPI, UART, and slots 0 to 5.
> qupv3_id_2 is used for I2C, SPI, UART, and slots 14 to 20.

Don't rush sending the next iteration until the discussions have been
sorted out.

> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

-- 
With best wishes
Dmitry

