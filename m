Return-Path: <linux-arm-msm+bounces-72039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 758FAB439A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100EB3BD90D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CDC2FC00E;
	Thu,  4 Sep 2025 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuIltYMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90432F6168
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756984410; cv=none; b=WS1YX5KZxE2SfDXJh+9eLpEsL/G7tQIvimk4dexwc9exEt3jeCLFQjN/6delwqzlee3h7WoypR0XV+VxcB817AZOmnd+Np7+DHroAEpJ/Tuvec8k61O3YbYS9XL3/CrkzUaqLMqZ7Strt5T9me4ee2i/xjalN/dqOUWbTY4muec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756984410; c=relaxed/simple;
	bh=xabmvkkMds2G1ykVMI0iIic3bnlXV5PZ9lhH9NfLEqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HckJiuRiQpTGdXu3WzLzvTfPDiwn/NUiqLuXn0JM/vx58bJgHswFsG5wo1a8HF0CvDJEJexlCFWBxTI+A4iqk9gXdS9g3UGB+DnM/YMFVFcvf9YmxkfqGdP3xkK9ZIBL1Mr04uDCDPzjNFYDT0t8glNJHw+ACBRQM/j93KA+CUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuIltYMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7KM022145
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 11:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ULLB+9K4Q3rvhisp74Ypegx1
	/bn4JOB/4G9A7ygv2oM=; b=KuIltYMktCNubo/2o/omv44YQH4j5GcBNFkL8lHQ
	bIxcz3Pvwd4uxYp4Pt2tp8nYHNbwotjTMLz+/8WQaFs7554Al8i+7Pw9L9n5Rbhh
	trDCsnQBPYcGKqjg5/XQ/i780Zq+7Kw+9qITMkLl47Pwft3ETM1BLruUMKiulzeJ
	eq6GiBs/CxlBcmA7lxLgvz4uoxk4cW8nKkGX0rMpc+PqlSQ95++IyTth+rMf1prf
	76VweQwvR8+IVPDXfNgoXjNwsvbFteYWv0NrQxIm0D8Oaii+n+lxs/VGYPuGlWV1
	fUr15ce8WE5+5lNX4xkZr9/2h2b9HIlShUx49mFYeQrPvg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk973wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 11:13:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3aac677e1so8210361cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 04:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984406; x=1757589206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULLB+9K4Q3rvhisp74Ypegx1/bn4JOB/4G9A7ygv2oM=;
        b=YzSX2rHxYtPxwLiURoWIec1NMcak3EG74jE92upQYUDiS85ph7qHwloFHvhIY4XA8E
         u/tyB1Nch7IP1D5OXa2ga/mKI71l+63YpgtdaYyImG2+Ewqruxi+FlEkWy8QnfJkSr6P
         LleYB9RnKk9hUQ7leQHBz53QUWxwjPQZhlq6yQWDV6CgpF3VvdLfHWiZ9fWdHTomFEh8
         RGYjuR5Rv1mbl/FTAi4AoO2hKHyhhsamqa9mf4hJyUKTMfFfcDvS8SVoDgdViQYTOSjh
         oiVMumluDkpbmm/d5RYuC/P6lZ9XL/KTsm37OHbmqZ6bOM9EDK6gNEiW5J9zeJPPAAz+
         IvcA==
X-Forwarded-Encrypted: i=1; AJvYcCUUueupXLBzQYv5pCYRVeQ2VBrwBis3ILSCSVpBGolf3POqp9Q/UFDODXyvR1MHbbVcN7D94PI16VLVjSs5@vger.kernel.org
X-Gm-Message-State: AOJu0YwVhbezegxNECIc9qlhUlgNIj1PYaNe6HiiGBP8h+aBAqZU8n7v
	xlhIWcLvizYscHOLqeoJ5vKaqruu8DBP9jA/iW7jw3SiWAcRrUj1wiUVEHIBAOmBC8mfyowbwRd
	kLb/lkpxc01XGb6kruw3vU7BRyPVEjXIMYs+vC6dNbb3OjhpWLnPI2uwF41keprZ1yxK6
X-Gm-Gg: ASbGncsMka3iWZyP+Ss64Xw109wf2nt7b1N0R0qBinQUA69aGT1IYwhIsIQo6dMMIAF
	SZxpkO2jbiipkXAUcO4m2TGp9pr9ZcmQKtHStPpeX8Wa2c8ZYLYAq5n0CkmKDbPjo/JuHPh1lkd
	+xZSe9gve6AYs/gM0jk8m4au+PnUNWiHbF9dBwN179cl8H/oIiC0Up0hOYSoDrvqbfLq8mWmOin
	wkt9b2BuS9qwQ5LAect70PTSqssO7Nawf2AUX6AETnlCPhL5qBGzwpVgDsixQYbvBMi3UOp+yf8
	8pihVCAVuZhbTs9cVI6IVMg3nrm7vERAT7jyyjzTHNITtc3iozxKm/tAb1DIyjPlURac+9OROIi
	cSz186Kdxx69wogoFYJ3D7KcVHIbLrmMsxrkJJhAcJPiG0QvCbfgl
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr206347091cf.28.1756984406486;
        Thu, 04 Sep 2025 04:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtpn8wmXH1fQWP57ni7jX6R0VHwMOxVbasxblzi9W2aBLMBFT18vMVRsZUaHpRFJcGl1jqQ==
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr206346731cf.28.1756984406044;
        Thu, 04 Sep 2025 04:13:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad0718fsm1116900e87.112.2025.09.04.04.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:13:25 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:13:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: qcom-qmp: qserdes-com: Add some more v8
 register offsets
Message-ID: <6nhnerb5yooodw73ku6yxtp7ud3irwhfwd5zxjwcwbws2q5y4x@7fj7dck2cv3a>
References: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
 <20250904-phy-qcom-edp-add-glymur-support-v1-2-e83c6b9a145b@linaro.org>
 <bf5e7ea2-9f0f-4d83-a567-028ffbe184bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf5e7ea2-9f0f-4d83-a567-028ffbe184bf@oss.qualcomm.com>
X-Proofpoint-GUID: zRDWFbwGRm3OuoR55PnJq8s1EtsMylR1
X-Proofpoint-ORIG-GUID: zRDWFbwGRm3OuoR55PnJq8s1EtsMylR1
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b97457 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=YY9QM9cTantD599Z194A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX9dP4XpiXfA+r
 tUyhFl1uCAsh8/TrJP+fmJtP/fgx+VNJQ6boAeQAQm+KGRnBQC4IGK5ZdZzSpzZkLFsm0rRA4h8
 4rt/taJ62QhFpYPqlfM19RmWVyqfWb4l9Nw79uvxswfZxW4XSng4ID80+dR1V/b0CShE6ornOtp
 kfiDwrHW5mgGKJuWwHbzIirB5zQcVF/tjaK8jgupA82cjdl9KUWYjwhsoxFbwIqzQQffZ0A/RFZ
 CWQ75zRepNh8sWv289c/9ybJcBfkeBelUSXw3Xejo53TJIPT4wutZNRYGEH7cewx68ZcK+gB/fA
 iZJlysl/jd6/nGBz7LOYHzVOP31pQkmvnfBPwOfi1+yX7TwHfuDOmITuty+NMgG/+HmvFgq6YOF
 VxSYBTe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Thu, Sep 04, 2025 at 12:47:43PM +0200, Konrad Dybcio wrote:
> On 9/4/25 8:55 AM, Abel Vesa wrote:
> > Add the missing v8 register offsets needed by the eDP/DP PHY driver.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> + a couple folks that I talked to about this lately
> 
> Please create a separate header for this, Glymur contains multiple
> "v8"/"v8.x" PHYs that are not identical to one another (or vs ones
> present on different SoCs), even if advertising that revision

Is it about v8 vs v8.xx ?

> 
> It may be a partial match, but there are also stark differences
> 
> Konrad

-- 
With best wishes
Dmitry

