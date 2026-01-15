Return-Path: <linux-arm-msm+bounces-89121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E7D22C11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC7ED307C9D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB449326D43;
	Thu, 15 Jan 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zzk2Jl+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiJ1tN09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD4326924
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461227; cv=none; b=AEqbtp4pbOUIDUeX+kw3GVn/PldrVskechVzJaE574ft8PZZCvelNiqlMzRiYs2w5oFCK7pODEw/9Fr4Lx7FEn6eJolsyaZ7NLp8FRCYqUgywk2dydoSLIRS2nlvJ0HfkfvJBHpELQwPONICqX71UvWVuz+XHAnW2dRCNR9FNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461227; c=relaxed/simple;
	bh=gAcPsLmv59wfUIDbKrFBmoYiBiBRusqmyMUSiFFvBMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYNfRdnoGSAvuHn8O+oY6PjR1fAOsQnk2/ZGiYiaE66e7R3Q/jkJoG8OHnYwXOUPjDDlcxyasp0lFaN4ykiW5aPi3CwrqEUGVnBrTG/1hV8FAn2PCSAJTB29Y47VsixOylECgNpcoxRU2RuS1CWjRPMOzy/PRpBpP5wNDVCcmQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zzk2Jl+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiJ1tN09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fllJ3419286
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pvo/SJg4hSLFd4n3lMPTx1M6
	bVv+CIKkP5gNIJoodWY=; b=Zzk2Jl+Zgk55zLi0g9/ob4bJ+FSX+1OQgZtFCPQv
	fObUv8OBJ3R2EJY4UWeVFf96O7h8GTx1Mk2ziJEgbY6tYTKa/cqUacN8qORlqIZY
	v0TasbmHx6nfqzIXKSko6oK1CivZwambtxqJ8og8MrL/czMFI5uxTza5PLL1Mpm7
	ap5tjL6GE7DDhxU5ne8mROa7fchpL1Pnpx8CMEi/zIFvxXbujLgWpRbEiQLZiRC6
	cx6IV3fEgxgo673bqHlk0KT5hHAfViQYWRYMHiHHo+ipMYBh3mTe2Wwajx2vv+su
	P2gxkfjUvu1k6wFPo84e4DqeHBoI7892N5JVLewaZljNng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89gjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so180813885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461225; x=1769066025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pvo/SJg4hSLFd4n3lMPTx1M6bVv+CIKkP5gNIJoodWY=;
        b=PiJ1tN09UkxtYX4lEoMX3UUspqJqigM2rWcKHtYMsqSTbxBdYiWFWc4h3GsqWttbv4
         yV30jiNGXuOTEMkfaYEqZ0IaKY32ubZuogfIeU0kZNWyWEvynukUyOFuR4n9+28kpL6D
         GqZWWzErvhrAxzajtOE29WSGu3Gzs/qiXgg6SYCvy7FCROUIJ4wnY3pqYMZtFiSvRmxz
         6fO8dwIhBvUdwUt12PWLsHTHdpjDxg7+c4VpIl8LO6vZoYgI0s4SK1eUYI2VmBwe0f5+
         hqbOEzfj10XdrUX79HBFyN8uGFb5r0WOeQJMOBBodyuGA6ZtKjhMfsxkLb08P1iK9hyJ
         jh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461225; x=1769066025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvo/SJg4hSLFd4n3lMPTx1M6bVv+CIKkP5gNIJoodWY=;
        b=uFoBBhTyKc9pRmGHIvs4McjqXQdddy3AqbT23KNTi9S2qdon+rRPS3V7H3GoKAhuqu
         EMSCa+uU5WlKEWwAsirHprpIDFAVpDoP51P94nZeTj7LNjLV74sfK6ZQyUSkttBnuOtP
         DNQBZy7BVoeSqxT+DAJ/sue3dzHrnRr6lJzcS/BXf5bz1KIWzRqwMfMuqhomjtBEfIdz
         lDuaX+JU1V27526iyaS0GmNFCyx4rzTaPSNOd8eST0EHZo9GqtYDj5p5LwX1sqVfFkru
         HQkMDJ60gQkOr/DoHrWrIKeERB0mGvPNBtJHzwf/R9IL+kTRlQtH4A8yqMZy8AVccuQM
         n+SA==
X-Forwarded-Encrypted: i=1; AJvYcCWKMT/ZtK3BJc5RrzxWc0ZY2OUpbG0MvPKHryMSsZggg9zr63b6lriDl5gyHMRBYu8bGHQRVC+M6dxeLH0O@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOhjZHnoU4AKDSu71dODMPAqv0y0orL/kdNZlJfm5SQalO7vT
	Squoz7kAZBb53fsdZn9LuYx7xAenyysmhxuT7/so1Ab1sdps+/RM9c2U3jNmJQBktbXLDcctEpp
	2qULuxbOAh+uvMYwzDLC0ws479McSNN2GQ+zB0/NxSm/MFZVn6NJJmJEsPrXorWOoMtWs
X-Gm-Gg: AY/fxX5DN9wzUiQnhxBuRQG8HAVKdxIbv85MT1OE2CExXcD+oz+UcZFeQRJOhTcTPse
	Fr03wTqtucDAmd4bvGxWuRv/Vlyv4aSrfjAXo5bkzKDPDCvT2RikFWl9SmZxB+TUDoqOpOrpYtZ
	SWPPABWyhfiszbe4/W9gYuQO0+gM/46GOP+1wGa6rRL3YYWS7yfVlSz1dOd8oWhkV4vVA2PHxlv
	pn3W/AlJ3jbEk7LbzJ44LNE1sU5fLabVpcleTn4tezXvnh2Tq1wwEbRb2j0agG/qaa2uNJAvwUp
	MgmvVk8bjGDM0M+UioeGHtsF1OmO9UdKPQ9dsqMOMKNgiHaWHI6kIcD4mOTwtArHPpEodD7ToBG
	31UNnqA92ekIqd29QeZovUddpuC8vxLlCpHQqABSVl+N5BhKwmfsVK89t3jlNyLwir7/LnlgO5E
	eZFguOP/cvSbupT+cKeFzW3BI=
X-Received: by 2002:a05:620a:404f:b0:8b6:134e:22f8 with SMTP id af79cd13be357-8c52fbf0bbemr708784685a.60.1768461224638;
        Wed, 14 Jan 2026 23:13:44 -0800 (PST)
X-Received: by 2002:a05:620a:404f:b0:8b6:134e:22f8 with SMTP id af79cd13be357-8c52fbf0bbemr708781885a.60.1768461224157;
        Wed, 14 Jan 2026 23:13:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1049ba0sm1396439e87.88.2026.01.14.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:13:43 -0800 (PST)
Date: Thu, 15 Jan 2026 09:13:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP
 and CDSP
Message-ID: <5ycxagw32uo7f24u3msnq2jaq62ilfp37gjrp3iwb5cckiyd7i@ebw233oxq3zw>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-7-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-7-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-GUID: 9zSpcsJSaYjG2-wWm0VFKuonvSvY0Fuu
X-Proofpoint-ORIG-GUID: 9zSpcsJSaYjG2-wWm0VFKuonvSvY0Fuu
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=696893a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gN-MXTVEkoJnf6QcVyoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NiBTYWx0ZWRfX5BqdzJ6nBmDw
 P3OF810E0y4ykTHP6YpluTcY6VHOzQJe5hzBAxs/8DbhBDQLXQr+dFcXUbZ7pfWf09JdENVszbh
 O5k28+IL/Xm8LjSaYRHEz7bLRiRdY+75Xrw+yaUvZmQHk4qPa0W/2bRCsBXTuYAF1WNVAzg9Lp5
 2b55UtdFeH12TRPBu/BFGTR4jvUbzAoH2USZO3Bkke7W6RvPzItW3zEi772r60rkJeFoJCdkXDz
 9/k2PkgYa8eugM+UCB1JsxTikPwiLs/PMqoNuhwYsq2wZ+z8d59P3CFgxO9+V10jUNoiExxJgco
 XwO+OtFqJD6bB3xH/zMLO7iK76XF/1g/7qlSOMvXuC4Dq07K/yUe05BfIuCjpaCBam6gwKuyisz
 voVv4MRqezxfvTmYvMtW8FCbdUtJKzkn+fBlIEzxLJUI952uPVpSsTmkZXZ49LUm81gi3p12wbS
 Wl+4cxzCDYBGEna1JtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150046

On Wed, Jan 14, 2026 at 10:49:09PM -0800, Jingyi Wang wrote:
> Enable ADSP and CDSP on Kaanapali QRD board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

