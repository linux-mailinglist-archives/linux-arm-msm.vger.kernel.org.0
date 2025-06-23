Return-Path: <linux-arm-msm+bounces-62064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4435AE4039
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2231625D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5EE23BD01;
	Mon, 23 Jun 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsBm47k4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE591957FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681501; cv=none; b=pzmsSZ+LrUM39PAF5auQa6N1k/xyLe3kmysEoSxxEdFC3b2NXPbF+aIDqbAGBbaDv9WjfW3/xRyAg664jPWUrP5TJuWEoFITEI2o3We5ZF2fldbsjEZoONrPe7nH+i0QRuIYknaa5aWGyrHxOm9dYFs8mfTSzOQDBGddx/Qa8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681501; c=relaxed/simple;
	bh=fzhUimtOoDqURWlrpzJ2tptbogob8EGE3/Ps29ceZfA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7ekndqy45jE5juKA2D06uZu0Uv+Hsknt+TWjrAmzzdVxBdRuWj4NWb4wPvVvZAri9JFzxmG7af+IzsqlCjzYDSPxWvA6FdGossUp7qoKB3GIr6+RuY9y5AYMjOrGyvRgaalsyqp71cfiK5+UtqkqG3miZ67GBDFKcgUB1ghEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsBm47k4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TPfR020843
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lpkVkbFFzrvmphzfIGrU6Jd
	Kd9k8Ffe4NozJc/9opA=; b=MsBm47k4skDxtY+Uv3Onf2K5mjv2vbUvMYiDgk5D
	9aujx/mCBZdxI+QxA1acvBNe32ONBgIAcNqLMt2gqByP+BBWG+FtJyMTgysGjVxT
	0Rkt71eJ/03QeEnDeXfYHY1lw8zsNg0E1hpMODvAQvblKvy43g5jby+GGHcKsoh5
	2KLqWDKVCeYYQCsNyYDeTpRJvZf6qo2Pih1VX/PEdaitgDp5PhGPu63eWHbHL606
	1tBf2+92gCbjET1ej4JiIyYNyYD5Op41DZl3W0OLzXHsmAG3fbMLJvHE3Af4rUkM
	8q5VRodbTxqke98b9dIuF2OxL5E4lQ0a20VQng/v4yi2PQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rffg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f70b93bso66075856d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681498; x=1751286298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lpkVkbFFzrvmphzfIGrU6JdKd9k8Ffe4NozJc/9opA=;
        b=V2rTGD0BwmsOSxFMwRDSBLNffIBKlIIMcqLX06KCgQ9LtZIxINCUXnaV3BBfhARXdx
         hhyKSNisuAadwB4sYUZv2UvyWKSt3qQzWbjbGUzBLIhnG4eo/pjRWMZmxZhrl4DtN4Wy
         NRzImClMuCFjnO24X/d0Db0p+v85h3lhifbER3BO62Ye/5x9NMCByO7e8//aktClH/jt
         UVGD7aWyAYisG1Rv4XE53DALXAnXKUibUaRFI83FUOzSLr4xgPvvOTpPw1tI+fCV21S0
         W+B7K2wCTiL4G+BTdADn0hny7ZPiGvCZFBcwhB/nuD9NCH1EiUJlOQJfgNFE4JInIxHI
         Y0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi2DF+6zauDsbNmWEFahXR9GY3/wX0CarzAwTC7vyhSXiqaYcVctG2nWJYb/27eU1vjMqNvquhBg5jT4gE@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBp7lCJzmM6oI0qdTNFtYDslXZl+7jEOE4p8DZ98yAJjkJB08
	wPi7BxkQi0oc5A1TCUJJdQr7yfPOfa8oqVhevwgWAqO0XxJS4hrIp+OnqSYZRMDgb1JkE2aytbQ
	QC3H8bL2czdooTNSFqVzraadK2zXjOisD1a7uSeqn9hZZZ252jQYZ3TEsXSnF8L+OSW31
X-Gm-Gg: ASbGncux54HnFFCr7YFR5ATBPa23CW5aZ6zjGU2/HJ7G8wJr55zBET2OyVWv8q38ASE
	xpdzuuUnJTo7vFebZBF7QOOQzhie2s2GPGBueQJOVs54HLZHA90Q5efoOKmfiFyujM0ICwy2QgI
	re66WHBF4NrElNEaSH0ssn24pHOWBgR+K861DKg0JFRdjWkkPnhUDtrOc0goZ9kEHwzbnpxujt2
	FT3Xw2Z9Sr2oxAgZkbkSUaFJald14cVDgD/W34cCHjO0/smOJ80B/0MXYiinvU9MwOVk6GS9jrS
	HKe3e/ys/qx9duwY48GTyRUlxvFMDHbX0fWbFa6kTcA8ntDyzrsY0VOi9A==
X-Received: by 2002:a05:620a:4610:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3f9930eb3mr1617102585a.42.1750681497610;
        Mon, 23 Jun 2025 05:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxicgaoGqZS7jGBzLs7Z+Z09iOtzjIk4ozOFpADlSlP7VJDpknaILbMhdjXScjGiHwmi07ew==
X-Received: by 2002:a05:620a:4610:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3f9930eb3mr1617098885a.42.1750681497024;
        Mon, 23 Jun 2025 05:24:57 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1508sm108268135e9.12.2025.06.23.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:24:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 14:24:55 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aFlHlxO/V3MMARVK@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
 <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NCBTYWx0ZWRfX4YOBSrpNXvJy
 L76w3D/hIafrHO8gjzF0c+4katTxWa96T3G20cqm3YR78LXXZ4o+SVezb7h/YzwlPt5KMPvNpcN
 X8L8QbJETGbz8uVFSP8ge4xeXgAhQZJBXz2jSd7DzyYzkVD5Wp49qhRGECAdifLbjfrvztRYgcN
 sDjIvxr8T20ci+Wg0aK7cCqXRkIis8t6QXMC53QnUq2TDW0kMXZKjEYac8CY9p3Sr5mLnYQehrn
 tewCZP72EcuqTqPetF47WhCW7BecvRaTjhZrt8C2Ey00ZgdT4jibCDBvdJk1K/Z6hbW8ek4bGVY
 ydmOQqsdNs4NS2CD+mbxNoBBOjETRTsPv4mUvd4qXFP+guAYKAXwgc/peJt/Mut+9MOrzfEPEwU
 ncbIijGNlX/ZPCaESVq1FBgI2jh5jmryHJsKVHXi1SuXHKii0K9Tk3xL2ONcxOxRqKsqfQ4P
X-Proofpoint-ORIG-GUID: XzLzBl5PYGU-EktqnBmEGma1QHtUynzV
X-Proofpoint-GUID: XzLzBl5PYGU-EktqnBmEGma1QHtUynzV
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=6859479b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=MRJ33UoC1PT6Y8aHHn4A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=642 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230074

On 23/06/25 13:49:21, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> Don't send multiple versions per day and allow other to actually perform
> review of your patchset instead of sending for every little thing.

No. this is not what this was about - I already explained to you the
call I chose to make. You can disagree but you should not misrepresent
it. 






