Return-Path: <linux-arm-msm+bounces-73541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4133B575BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C2F04E187C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1262FB0A8;
	Mon, 15 Sep 2025 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBc6wlxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87302FB08B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931143; cv=none; b=Rz96AD3wAtrbm3wA2YFz5LcaUvouOadFCOcTS1sI/HBSMP+maxjicGO4A7pJqBkzH1prLWV8wozigf3nOo+TS0Rtmum7LjezEAFLfZ/HMvszeuMUApnH9Mis4t3gxPMy9azkz9RKowmi++t1NOxVCklgU2OKuGyQZuKL+Q4RUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931143; c=relaxed/simple;
	bh=jG342V/c+j5CoBX7FP4+dyAJiibjxkiQ+yvM5FWlx9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhKSqRT/wbbHBowAdxtgENZ6uYsJNa4AElb8G6KPBPsJjbxgo3k/Nh93ZeJmfy8kk5aSAXIa9TVM8GHhjfBgIVkFa2Y0vsr7doi/vNzuO3D2ZUBQUMIsiWDJgn4VriaES2ZMaFYH+AB3e8qrhIIWMRaV82Gc7Vr78H63gEgx880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBc6wlxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FiPE002363
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKD/3kPWUFAIEKI0UmpKQAcxh9lP5Wru5KsNYI2Yxfo=; b=ZBc6wlxTY2NrEsig
	4fQSCUgYY0661833ZRKf3dhutGaTAzFuHKLF3C1rfXISL2/jQUDk9D013zPWen2u
	wZIPk1j2YBJ/R2kQl07dACQ8jGwRzyItehxgwlk9Edh24ZmWGBY6yc0NnX3mcafn
	0HNtDPxk0fs1714LQ6pRoeqkF0tzHWRE4bSyy6Qwq2eP4gNuu37lfyKUwfMoHrVE
	QTYIw+5pNEaUPbC9mwZ436p61Q2YDL6KYHHsKtmRQiCjQnjU/soVB0yVci1F8tab
	OV68RFIxLx7hl3P/HKZr13Nn2vxowr3nXiMCJpb/wjfLKTnd2EgynxizCnhZNmG4
	B0N/Yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da98uxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:12:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4d01b30e8dso1071903a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931139; x=1758535939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sKD/3kPWUFAIEKI0UmpKQAcxh9lP5Wru5KsNYI2Yxfo=;
        b=utlVpoRsXz7oe09qrMNbnJhLxH2UOBMXVPlr9i6GAwaM4GasJyjDQrwWFC+hOEPjbb
         DlnzV2p0tV6s4b2FbZCWzV1iXbPxBBl8vmpOoc4gA2kMx0rJtQWtMWjIk7Ed9qUAmlRn
         ld5QFya6D8W2IjBSY6Xt2tYB7IICPpYrCdxpgCwPZ3pq/XWtNP6ZRcLl3ZSbznCRnxU9
         1zUXkAc+AWFMM2VXxEj6sj394S7kNw3Wys5qecj8l9sWnLR4cPsliv5B1Y4WyQWXwsBs
         o2OEWb3QNalEpI5gWZFLyWPLV2ZnP3+2yB0HSHiWskDgWF297UVDX5nwLpqZfFOoJHc1
         nJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCVE5J7dg+ZBE/tNSGXPlMxD57/R01GpWbE/Mkx4taLiJFor4x/3qhMUPliuUwqjXqESKosFbwLCpTx51SQm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1fepEI2rM9YyOnd9RTuAN31NlHHh+tjFWCkTH9GyXVPRzDXdd
	AFI49/Cah1CLehkCBseXe/id3yJk1PUNQ5RUHTJd5aV/x+QeRtJNFUS92am79BbRSyWjH2wQMSq
	xImFetUIW7M9Z4PN95d6aamEyA7QE4sjV+16epv1b4E6tdSXpGhYlvcrxzi6+CFsRynFU
X-Gm-Gg: ASbGncsSSzSMDwILhVfMypmJkRYhJVBVLajgaI5btEUaXXhKToD7IO+X9OvO2xQ5EHj
	JEwZpLyXvW/RIizBHRW5g0SEfSLNMGZkvCtW95g+EvUI9MTjn+rANsohMsGlyu+aoy7Hy8IJ7j2
	zC1G4gU3xcrSBRrCVPyc60XT5gRLJ9x9X+r5E20bc1eRyoaiq7z1kPn6MF+wf6picQdMj56RjLg
	NncZyp3eoQuVcYtkBAEq9KzSoeVSY8keYBSQcCRtR2Q5kCIO4/a5I7IIieQPby+pIEhnQD0nga5
	5DwBYeDjLNj1bNDd1/RusPEBpROFs4p4Vzh+8/pwCAIHvO4pDTc/uyGXh0sM/a4hxoW9cSKn2b/
	D7eHyjxix+s3MnaBYVDqDOVLwvorHkFT/L34=
X-Received: by 2002:a05:6a21:328d:b0:264:10e4:f87 with SMTP id adf61e73a8af0-26410e411fbmr1664422637.4.1757931139300;
        Mon, 15 Sep 2025 03:12:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxZXxZBGVcbThhG/IvVDI3mpTgc5wznmZnjs66RxbpQzCycjFMO9w4+/RnbJr+43MLjBFNnw==
X-Received: by 2002:a05:6a21:328d:b0:264:10e4:f87 with SMTP id adf61e73a8af0-26410e411fbmr1664402637.4.1757931138808;
        Mon, 15 Sep 2025 03:12:18 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b03cf65csm8329380a12.16.2025.09.15.03.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:12:18 -0700 (PDT)
Message-ID: <f030649a-9505-4bda-9ce9-00eeee8d3b06@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:12:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
 <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
 <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
 <q4dplt6fq3cneludcuhxevklaj6omeio3cjxw2owt4h3wistd6@arv23ri4cl75>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <q4dplt6fq3cneludcuhxevklaj6omeio3cjxw2owt4h3wistd6@arv23ri4cl75>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7e684 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CZmHqXGeirO8O24YQhMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: skWYsmZCzm24g3_OrpDx2L1JmprpxCdH
X-Proofpoint-ORIG-GUID: skWYsmZCzm24g3_OrpDx2L1JmprpxCdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX36U/MiOLbsMp
 eJJ5qoa40Nln//5ORv9YhHgTk3fZ7tDX3qTjmMNXWCYIv/9cKeJtVJGoH3PW0zuP/8v5l10suly
 8Q2UN72igrkAMrBVB3XWAFUTB0f+RgsCTORsqPy2SgnfFda8teTdwpJV6rotcFHD59PZxy0qP+b
 b1UOE6N7S5N/2lCUu2nM6fV8BYVbuhO4qO3LH32hBq9xnjIO2/UjcZnF63FXDIC5J8TBVGAO0K5
 oGk+c1d1ezl1ubEvtrECyqLmNo1GPQvVN0W8K1UrSc1ipZhNT3Wr5k99m8GKFS4Ovfiy4nVKgQt
 vPwtQBpbIiji/a7heRaQ+nTi8Z6/KvcS4eiGGGLrOQ0cZrs1RIegxJQpYO9spwg9uIM2CN6FUxX
 rzkDAelx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056


On 9/12/2025 8:09 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 08:03:01PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 6:32 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
>>>> Introduce mutual exclusion between USB and DP PHY modes to prevent
>>>> simultaneous activation.
>>> Describe the problem that you are trying to solve first.
>>
>> Ok.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>>>>  1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
>>> mutex has a very well defined use case - a sleeping lock. Please find
>>> some ofther name.
>>
>> Then how about 'qmp_check_exclude_phy'?
>
> qmp_usbc_check_phy_status()?


Ok.


>>
>>>> +{
>>>> +	if ((is_dp && qmp->usb_init_count) ||
>>>> +	    (!is_dp && qmp->dp_init_count)) {
>>>> +		dev_err(qmp->dev,
>>>> +			"PHY is configured for %s, can not enable %s\n",
>>>> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
>>>> +		return -EBUSY;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int qmp_usbc_usb_enable(struct phy *phy)
>>>>  {
>>>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);

