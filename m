Return-Path: <linux-arm-msm+bounces-71553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA44B3FEB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A794E0824
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEBB287254;
	Tue,  2 Sep 2025 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3pPskEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56C283138
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813649; cv=none; b=bYt6oWsEM8cER4bSGShzTRq/Rd0rkGqlyPKVI2/y5oX4RuWP59UiqRUW4q9xEOnX1YzFSa0YZ+t6v6mbVCIqVyera/fYsrrrEvIYUCDQ0YNJF828f5s49RY0GrCscoUU1wYv8DTk288a5QO6QuInjyEX+J/KbakL77ApMOD1baU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813649; c=relaxed/simple;
	bh=Efg1Sal0KX5O8uYenvTI/MzkTGbrZNd4ohf0F8McEG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ub5Ggkvl2FhgTIgPa8u0t3i6pYu3Tu0sasFuXXs1Izev/mJnzmkVwwcG6mi1o2KQ+8HjaNn1rNHGjqbCiso8A6ZAt54JVymN0VAd63TD7KXa+2XK+oDyNkNBcCgvJdaUyodGzeMFIGuOIPJ+6X8T7wXh2L2vZPFERyeFHhAdcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3pPskEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AKf9m025153
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 11:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vTMTDMliYIWA3QTZWruvIxOrprzqsFuQP3qBWa983E=; b=n3pPskEY+Eh83K48
	/AyIcuimWmqNruTTtWvxMDhNVoW2VQtC9rKYwTLztaLXfKdbZklJBtG1Dk+Mt8bm
	YXEM83F6t/MKboEyU/t+omkD2O3hp1ckF8phDoztzkunBXbqb9ROnyIaBwmZTaRy
	Z6riUIPl3GnJwacNqqXWcfbh8a5SNV/c+DTPNwrhzKFD1M5VyttREfZqgvCBZeu/
	pKgT0GAdFUIoAuMuqapYv1HWrtyzFH+3MXUPPJt7i0BcFKQsieaLweLFM3MB8h5A
	ZVHqMbX0iXUan4RJ8jUvYNhyDCqe/3uGRYTcrtXTyHwdRn8hDnUeOjW8V9f3oAs2
	urVuRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuyp2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 11:47:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b33e296278so2258661cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813645; x=1757418445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vTMTDMliYIWA3QTZWruvIxOrprzqsFuQP3qBWa983E=;
        b=s/VEpCCL5pQj/wNxfZzcZVGTevngBDGqIrj8aew4Y320bjjs7BoeMAHank0QJ3iIxX
         QDAC95eMzMh1ZWFJbHI/lDucmJHhHfTkuALHmKn5lCInsDbnlJOcVtskn9ESSTPQ921R
         PZUNUfAqSoQCpBWMs720jLr89JhTiBKHQKzQOmK4gysM1LQZIa8RC+4jCe8NMorQpJn1
         MK57kkONFL+ve83cGRmWXG6wv66IMbMYoZhs+Yz+N1jZ+npMXR8++O2/aKq87JqEBqeR
         gNgG8Mr4kDppls9L+ZC2VrROz/36AN4THga2EXPpeQz8vu+p7KmkoceEA+tXwDljTq0S
         r7fA==
X-Forwarded-Encrypted: i=1; AJvYcCWuHfKn5hwqp1sJ6BA8tSC9vdjJxW1dTmLdrROHt5JgJenM4lmCZDgBywfOW4CFy/iQVadke84k/fvx7eoI@vger.kernel.org
X-Gm-Message-State: AOJu0YwbgIhnmt0VejHkmi0KPuqrZhe3S1Fex/4/ukNfrV6EoipiTzK+
	XoN5vie2K7my2Tu6FmqioHFCM0nni0ulGS75ybaYpD1pkW3w4cEV+DZ2Q1CNGZyu3PnixpLHDDd
	bPO65gi+gV0zpPz8bsuOg5V43+NPSQtquNIQ/c5sC0XU8EvYfb//lTltoJvLk2Kcov/aP
X-Gm-Gg: ASbGncul5PtMd0qAA6uHEtHdRJPgWXBcsyheCUiOwJeWXI5iEn05fmcRklJucVj9iTC
	PP07dpWqC82p5k/4jLzTZS91vtSnNc475vwHkCRbhXwCjTZxjA6aLOrAFVv5VeJDZ8dVLWrJ9lo
	tKG5P8DuKZjFyih1xc37p8syRiyDQQK905xmeH6aPIkdwQaNZHOajr/fd649WT+Okqx9Z43vUMS
	cuMBS7+HI5iCMMpLfnY6oRzdrZwAJnQ0SHdVIBdZ/Kd06+MPGzMGARuGzXcfFsbYuLbJSWq/rok
	+m9lp4i06/oTyFJ2+MDUHbqu6fY5apuByTai0itGYFDSsFyt9nMKJQ1jeGZyvi3sEyGPlHnjL4A
	sxGH/wF6iN+4rCH7eYMuekQ==
X-Received: by 2002:ac8:5804:0:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4b313f0e2ebmr130498491cf.9.1756813645512;
        Tue, 02 Sep 2025 04:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa/TiGzm5CdFf5W/mtmjzpcHIClEM9pOfrKxv/RTV2a1ZzxsQKuK48Yvc6XvUx5Q34m34s4w==
X-Received: by 2002:ac8:5804:0:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4b313f0e2ebmr130498241cf.9.1756813645033;
        Tue, 02 Sep 2025 04:47:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041f00d4c2sm571868366b.97.2025.09.02.04.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 04:47:24 -0700 (PDT)
Message-ID: <6f9b7f9d-9ec7-4827-b6d5-51c42b5eb7b9@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8450: Add opp-level to
 indicate PCIe data rates
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250819-opp_pcie-v3-0-f8bd7e05ce41@oss.qualcomm.com>
 <20250819-opp_pcie-v3-2-f8bd7e05ce41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250819-opp_pcie-v3-2-f8bd7e05ce41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX7HVLojr7Mss4
 UpiapCR0AXdnOxwKAqiU5UCmfZ5WmeMxDB14Oqm/x+TxtJPEY6dEYtovbMJfE45OfwWAMKiOaHi
 pRpSgV6WJYDl9HI4kuBHmgMnijlIeI4Z+opIEqXL7qljXF14blll2u9Rs6GwMyedaXKIl9KEQIo
 LPOwEDJ8t3YS0smS9qpGS9pwh/4O2H3CPJ/QTe6bSENmcjp4nG9czHL6b0HNc2vxdaN6xPm4QLO
 4b3F5f7SxIc7sGqyEdopJWeVDZXflKW9vN+jKkPK/q+OVWSbTePoERW0F4Zd56fDB/cBAgcSHls
 IgVt8zGdBK2MDAYjK1UJKqSoEeKc84lQ97xsmeNIlpgU2IFQmNtR57zrph2vKB/B6mGJEFxROBs
 DPvlcNY2
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6d94e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9GgIB5u8rn4IvP9w3Fz-6JWQFwsWGNTL
X-Proofpoint-GUID: 9GgIB5u8rn4IvP9w3Fz-6JWQFwsWGNTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 8/19/25 7:34 AM, Krishna Chaitanya Chundru wrote:
> Add opp-level to indicate PCIe data rates and also define OPP enteries
> for each link width and data rate. Append the opp level to name of the
> opp node to indicate both frequency and level.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Are there any other SoCs affected?

Konrad

