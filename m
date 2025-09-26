Return-Path: <linux-arm-msm+bounces-75348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8438BA553F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 00:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A74A67A135B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 22:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CF729B8D0;
	Fri, 26 Sep 2025 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cog++oYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5505A28D83E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758925731; cv=none; b=XVtfAZAS5xTJ8V2lwg7X+oWW2JflK6GEjdrHwJJ2MiafK+4jr8KK53WA/I5UB9PNSTEjVUlfI+8gUTE93nKCIMpRvP2F2V5Tl0fULOhkrfQOVFt6aTigftYXjhdj4WXD2Dt897Qdxpc+ARTmrrPVwfQnXJ9X44DzCm3MbtGUw/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758925731; c=relaxed/simple;
	bh=C8N1f9UQxgYnwPhQiHttxBqUF67ClxX0z43nYhB+AT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmgUIXZQvGwk7x3kdHL+Tb9Mre/uk4GwTupfA8aAmJlSehZsnl9ELRTQQUN2G5znR/jUT/u9QjY/JtoIVRKb9bFcIFdipjBvgJQxvh3rRiCGg1fIYC0ymyXsA43KpDLeK1us5yQJy68AhU43NUPR58iUQ4P6Fzm9crZarE+u9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cog++oYc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX9K2011364
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MRd4LCd4GH7g/51mFAw6JfnX
	VcEmlPTkPoanPe5h3Qs=; b=Cog++oYctCGSML4DQ9CepK3CbQKraJJREoPOW7L+
	P6nlebop8i2Gg+Z7NpvB9XoecTqbAR4SNPm07NSxFoMdIxzCl7TJ+LIekC7v1bZQ
	C7Xn3fy9Aol3FlBf49Rs2fcDIGMvXtoZslAd/y2ozIHeVkrUJQQac8+lDKktKw++
	VRgw0L96p3NZ9wm67DkAwhXpMmfIFbFaymnDt2BKk1Ke1K6YJC+1oP+J5sADDrth
	dVm+1s1mNdaQ8FvyqhV9/GwKiSQQoIqsRoIHAedZWFbOTgsX980W620J7wlezL1C
	RrXFAidsptbUW0z0H2hTj3ssLTq/IiejHp3vTDA/zZjEOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db324921-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 22:28:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d9a3ca3ec8so49644451cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758925728; x=1759530528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRd4LCd4GH7g/51mFAw6JfnXVcEmlPTkPoanPe5h3Qs=;
        b=WxYTUveduOF+CGoSFTdo81UHx/xD+x9JEyZo/DuA6ID9r1j9Y68+x1eR7bf1HVtCNn
         fSKYH3yf5gXxU69hAO3icPWKJmbE6yjek7AsVrmIeAbgVyfZyCPSUzhjFfAyXLHpPRjK
         PbCd7a5sGLL2ppBSEoadhEL+13MWZNjT08rvmgSEciiDzYheui//RmLSKM0RlP05fOTA
         6GiQa2VxiIIz1kEGSvuwBh4kjhLGlbUIO8F3EClbOJuRmgc2uv0fDokgS0Hfq6yBn44w
         WuwHXbZxg4zyZ9rNZuLyFl2waALOa7tNufQdrt3RnnsuT998HonVd++OD8Xa2C5b+RA4
         UEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXKJdE7a90/vr0DYhVubAxn6THBW31zuBpg18D/FofjHHo2KDOmM1bKg60hlD0zm06lQXoiol8ELwvBV7b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Uc0FtqIp4Jr8qVD1etTKlVU5MKSDQemCvXNogu3wTJiyRVuN
	pjQZl4OMgHA6+/ut5780xgFhMAh2KrOGjjk2iFnSSBFHeEpA5mk3c6TdPKPrfYuEOsWHXhVmhEb
	pPMzvUHRxnAhM6yvVDAJEnnsXjFzRsdB5EdyO52hKCSCIX5voCfYm6SPEzFV/iNcDD4XX
X-Gm-Gg: ASbGncu0OLPzAI2966W1bar/vmhS0fVgjFQ6o5Z5hNX9EHC70tRvVLNpYxPnab/RXJP
	8US6LjvQppE71bRJ6Cbuj4I66h0+81zOP6HlWuy0zCz5yMWsu/4LhRNi9oRYCYJSQwz2nTlo2/5
	+idkM86dE4cOlO70UDIVGKAKmD+zbIF0d8jhJ5g3bSs1EfizKfHvHWBU2pz6rP8kMeT2vMfaIb3
	Dvk4XWmrewku/lFbTVZNBlzQcrWr52DisL3POs08vMdUWb/+KkcLsgzqdHW+btMBNgeziQ+8SUx
	vqd7eM8CKoP5TC5CM6vRLS1yej6PpHok1J9ke0Z7yTzPb7fPgy/7B6XbA54QiGHJGzyQVDcfQK4
	VLZozNjwtCihmoIYmjlQYE8DbpvvmiWlQulOXS7yXS7P34Qkb0kZN
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id d75a77b69052e-4dae3c29955mr91598381cf.59.1758925728154;
        Fri, 26 Sep 2025 15:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECT+nuGAx7AybGioU3MTy0w4rerMEkx4bs7/aNnHMDuso1+UFEquoAeyhJO8yc6dvhGeykNw==
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id d75a77b69052e-4dae3c29955mr91597971cf.59.1758925727541;
        Fri, 26 Sep 2025 15:28:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430dd5sm2149171e87.24.2025.09.26.15.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 15:28:45 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:28:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <yuklvnhgq3q5ddeakv3pmt4iq7jaw6csccpzamxfgcdcwguy5g@t5or6bzrwwoc>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
 <20250926-add-displayport-support-for-qcs615-platform-v7-12-dc5edaac6c2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-12-dc5edaac6c2b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d713a1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hsSiBWVQevx2fRdbtS8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: s5QSCbFd5lHEEMv8a4zjWGgev3KTUdSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXxGp+IxKp1fAA
 /iVCQ0jC7AkD/otrYpravjXYBd9pJYTm1kzdjCLJ4KUfhi1Gyqd6h0GdtMs/L4VtIb7/QbHRJOD
 idjqe7diwBSrefiU9/OZFrroDH+ECTa9TX8s8XIyNWeXMomdhb+Y+uSd3g6XuSjYnp3i1lP/E/0
 NsPSKJkEP2RyDBlmN8Q9RIP1qwOdSPOBZ4BTJio1m7qGQCdEqLBxpEbpsQjRDzNcAXkNNPN3DOi
 u2+Auc/doCuGcN+ztw4waOqRFtYM4i6qwnPSruDrtZkcGxUrQcrrZiO9b+pbVqp+DTmy5pLKkhg
 rvrNHLBnP1qrg0w9l0VzH/GyiPyvYwAyOrILzBwndqqpswDa8KHueNvntFsKcssNGNUq7SIdQFj
 Hy5SoSo+PzKcCaMlktrZpf8SLVymZw==
X-Proofpoint-GUID: s5QSCbFd5lHEEMv8a4zjWGgev3KTUdSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On Fri, Sep 26, 2025 at 03:25:48PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Note: SW_PORTSELECT handling for orientation flip is not implemented
> due to QCS615 fixed-orientation design and non-standard lane mapping.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 413 +++++++++++++++++++++++++++++++
>  1 file changed, 413 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

