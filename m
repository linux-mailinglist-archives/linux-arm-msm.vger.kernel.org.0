Return-Path: <linux-arm-msm+bounces-85699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48285CCC134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0124330F0BF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2106E3314DA;
	Thu, 18 Dec 2025 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixE4ki17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1SFFTwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A42E040D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065250; cv=none; b=uOmgTgJ7jZBPZZvyK1e6zRLzWtHBUFaKcTwyuK5oBCNNzsiwBbcCFEVdiK+IiiF9h44cLODl74EWcKIg4D9in85HUOH4UDmZSHnBfdj3mNTlTNy9mjUyCr7kR1hQ+Pno1MCQymsCd5hF8/MnjVC58egMYJpZyJ1kunhjckZlfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065250; c=relaxed/simple;
	bh=Okgxv1NkjVZ8eluSDjuQq6gAO3FD4dYsp+GmAWEU/rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onEvprBgJmaWZ3qfFTRue2PfvF3uxu7okSxlYj6p3Vg/OKdMRDEjSfgErkiWcDMy0Bg/+VwlIEGL38ZAf4PL6Lmx2+JIgH/ePQnZbkjp1g8oR3wjkqDMDNBmz8B7b7rzUpTSTAYHTZ0yUFbHKm8B0My9mMcBTJ7Z+YFkpaRdU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixE4ki17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1SFFTwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8rBf13447044
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KSp4nOkML7GsZiZB0OVroa94
	kpwiB2xK0hpFLWKl7S0=; b=ixE4ki17PeLyoawevgeon6/9zdzHsbbsGKMg21GL
	Iy82UK786Uwrsf1iKRYnpgYODlulXMszvmMZFEEMzWBnTYaHJlMSZ0tLdfft6/el
	hwGCYjohku1BJ5zdtKuz5cgvfLhSJNd8RnsNH9daBUcRH3luW3FgVDrrzTCtmBCl
	A2wq0rdm8/IkDYToWhvEmQ/gHjG8NFaHMmfr0tkfBm9Q80YYr8bejF8wtkRA48Nh
	tQh1MX/cTykRe90dMO7ZMORTKQSIHZPCAj5g63dP2DvmY8PBqi2cjB2p+SBksfD/
	2SQIH65h6qK+iqcg+y7DGj6ftQSH7Dzh1wl50qmF2rwpNA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4egb90a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:40:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804b991976so14347596d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766065248; x=1766670048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSp4nOkML7GsZiZB0OVroa94kpwiB2xK0hpFLWKl7S0=;
        b=J1SFFTwEGUjvgrM9k5Q5oyL15hkL9N9bXYFI3XUnM2qVEKcUiXhhEGub+ojUXv6DMo
         WBh9sm+YWt3Ce9eugkouX4IKZ0QpsbHhlPs4Hmfrm5u3EGuoU7c9Tj1HrzlRZh/p/A2H
         e6fVEIAnx3SAecf7hA8zFBxpNd1cXiN/mFYfRAJEJjJ30r8l0O0EofQrpEFgWQLNQ/9d
         o5fnsCKD9rcYPDfw6dqsiSthcNDd4M5S+Z5MZq0nv1u8BEaQRzyGKQF+mQp+BLP+zANv
         Znoit8MDDeOohVQOwOiKYye6z5JMgcDo20+UDMhdYc80lkX20EYT+iv50nw5jDGXNaLP
         bMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065248; x=1766670048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSp4nOkML7GsZiZB0OVroa94kpwiB2xK0hpFLWKl7S0=;
        b=bqzT4JoX006t12kkDkfkQsaOe+HRuJFYs5dx7/bk5tsqySrGR7paRi5NJeaClYsvQ9
         HrpDHugxi/oGlsjX03oc6FAWhC8CjVOc0t0O2lAq5XiEVB+CEHJIgpYk3iPx1AHZ/+4S
         NB7B1EpDsF5pJziug7NJYUEoS03KXuQUrJmve2O5uWNNfVOnEj+htqIBAXAiqbyIPuXI
         45z4wozp3Ha1++J5dZ7wtsE2T+ukLLtqvXofPcpg7aQOP6Z/Mz9QJv4W3h4A5Xu0IeTE
         U8V5UnslnBBPAx24WSN8iRSp0A4mekBfnN5C+hd0MQdCbd3b9LPq8h15ETtyEurWabyJ
         xUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbuqjGSS+7BWtHh5iuNcaoNckj7xTMvM5ojK83OuXcbX/sj5Q5BDrSb1Pydu9W68BMu94gOZWBFu/DeMyC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6naY3YWQxafbLMVZbUCkFFNul4TytZ82w8sCZFLD1jrrqWTh
	ayIkqBsThmJlpdyRIfJnaHmkGHk5l9Id1+khhHDZaTZ89JMPtKQcm3+qkzcvqOYI5Ojdm58GeTZ
	t06Xkpz8OuRw25BU19ruNuQ7X4lWuZKhBh68MBRG5lMVFLAw2LW3Cx2jYED+k0rIz+paC
X-Gm-Gg: AY/fxX7Nhv4sFyjwqC7h9G1xhrvl2DtsQHfUYO8Ioo43yoWAFwfnx8r//uF3QblgfyQ
	xAXOEZ+4yV6OGxz8StlPM4y98PK+VDLAkLbMN28AYN1aptaFueGeAfmTm5d2JYQIoyvFnDK5gV9
	OtPTRf7Qtgj173fmx3ucgbFpAimzEvPh2Mcob6CMSJvU+GQNn+t7JbFoNOOhoVISx/gTRzCU27m
	Aj7+mcNTMaPs42HH2j/YsjJ9xy5jVQ/kUzoqUBSvLLKzG0gu8LJ/a+SIYrl3kCWSkWFyWWKFqdw
	D+OSN6STWTgLeH7MjWdvjvKzkPc8E82GB8wfpGe0GnuSOzRKLgkPN5eu4nzQHYsLT2Wr2y2JpFC
	EtKZZkXcrrByowjF7yqpUAWFtI1vRx/yyfLJEWq445191PgMvZ6NgJHGNt2+3hzefhHDBz+EG1n
	kVNDxSrTMpHnHpq/DhZvQRhDo=
X-Received: by 2002:a05:622a:4a84:b0:4f1:b93e:d4d8 with SMTP id d75a77b69052e-4f1d0636f97mr283606481cf.71.1766065247585;
        Thu, 18 Dec 2025 05:40:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzuJ1gvoI4VRXqN3u0TGfdiU3xAVVJBqKptf77gpHj9DjRWW63NA9LcrIopaaichhpKhoY6w==
X-Received: by 2002:a05:622a:4a84:b0:4f1:b93e:d4d8 with SMTP id d75a77b69052e-4f1d0636f97mr283606151cf.71.1766065247151;
        Thu, 18 Dec 2025 05:40:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132cb37dsm1097703e87.5.2025.12.18.05.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:40:46 -0800 (PST)
Date: Thu, 18 Dec 2025 15:40:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU
 nodes
Message-ID: <isjyk3ngoyzzhf3c7edntb23n3smh2uazgeyhwqnzjvdnafzmq@42x35y3emgkv>
References: <20251015065703.9422-1-mani@kernel.org>
 <itksdoavfha6xnozfrh5jcc4g75gcfyxp7ns75yz7xfb6wruy3@qwkcavvxrljp>
 <qzpeft3wmmh7idysviyevrmfs72oeoz3c4dddizfovd7ix7yoq@6vtqz5fhknij>
 <b2bff591-807b-4041-bdd2-feeb89d4f7ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2bff591-807b-4041-bdd2-feeb89d4f7ae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfXx+JWhxh8SCg5
 +iGQcKqNxuZvyJaCLgM2JrMpQOMq9ThfMbObovHBWDxOWjrYmugueVQ/cZZznAMLQyG1ZEOKKmH
 ygbht5+lN8Y70J34v3lJfBJj6o/jce50UaeaAuLc7QJCN3TRNYL3pJyCXCmZyVCfayXbWjwJ5mY
 2TNCRRYULeSGUa1i2Jy13/8LS9jCD9NBVTRFGKkN/8nhlW7t3bIpCSz/SnQt+i7KBFiV913F6gz
 YIn/ag/wVVefFVYTD2wCpu+HB13bbhroT8CJdmSGGk7n3e4Bkn9iVo2piCVxjxml68rPoXvnasi
 Qix71oODyC5RUfadk+t1N9attbB1339pUVVeSIqOF3eBzzuAC+EiEao2spTZo6EyqqyXBLQyL1V
 15LFAYHN32mdbTsYhUVe/6uDTryJrg==
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=69440460 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVH7T5g6_hVQcxv55skA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 81otm9At17uxIjxa6iXaB3W9AyH6MrG6
X-Proofpoint-ORIG-GUID: 81otm9At17uxIjxa6iXaB3W9AyH6MrG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180113

On Thu, Dec 18, 2025 at 01:54:30PM +0100, Konrad Dybcio wrote:
> On 12/8/25 6:13 AM, Manivannan Sadhasivam wrote:
> > On Sun, Oct 19, 2025 at 07:01:30PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, Oct 15, 2025 at 12:27:03PM +0530, Manivannan Sadhasivam wrote:
> >>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>>
> >>> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
> >>> '#cooling-cells' property. This will allow the OS to mitigate the CPU
> >>> power dissipation with the help of SCMI DVFS.
> >>
> >> #cooling-cells isn't enough, the devices need to be listed in the
> >> thermal maps.
> >>
> > 
> > Not strictly required unless the cooling device and trip points are wired in DT.
> > But I don't want to do that yet, and just expose the cooling devices to
> > userspace so that I can experiment with something like thermal-daemon.
> 
> Rob, Krzysztof,
> 
> Would it be an overly ambitious idea to make #cooling-cells required for
> CPU nodes? I'd imagine some sort of cpuidle or cpufreq is desired on almost
> all platforms, which could be used as a cooling/throttling measure..

Looking at my museum, i.MX devices don't have #cooling-cells before
i.MX6.

-- 
With best wishes
Dmitry

