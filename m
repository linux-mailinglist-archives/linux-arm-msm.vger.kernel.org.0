Return-Path: <linux-arm-msm+bounces-89443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD53D336C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E45D30574F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EE83939A8;
	Fri, 16 Jan 2026 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="admLiQRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJFfrRz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC1393419
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580078; cv=none; b=ak7JJVhPtttmIOsOd7TIbIkkSuycZJ+gpSy6yvy1WKMaTGSTBdMhppNYEX+RCyVpnDvuccBFOD/adX1Z1CVP6qBnX1KrL6kThqJZL6kkD/Pb23/4JFRJ9Q9HBva/fNVqOT+Y4UJsyLdvhloKO1rLRLd2lz+Y6Gca+aQz1FDDwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580078; c=relaxed/simple;
	bh=0NeomZUVhHWI4pM85zDjcobRkdL9ncGwBHnR0fS34NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+o5Si3ggO2ynGrw47VkuaGciP1lwSQbIWBTWGK51zzb7wTwbOFk/uLEHNWCKTC6185JxXdiZ2slQhuqsZt2ehjnc2bCTSVxgvk6D9HYYHTRuMD/lfeag558IFfryC1ytfUb4n+c1vyDFlVoQvue44gV55ETpXBvxbkg/WQWpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=admLiQRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJFfrRz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8ZMUt4015681
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iO9mMgKv5vMJGUuLtgYpU0c8
	RogSqX4J8gWx7OGRMYk=; b=admLiQRsx4aHF3yyqFH8t8EFFxsrj7tfWMDegv/k
	cabrcY8oNgpk0AyNMO3OaFiplZqQizz+ZRX5damsP6Kz7OGi2OORQs7+km2B8l/7
	3I96mRubYBQA3oaXzHj4B0rOXmRbznNwydYCrYG16fCQpwvEnKebW3OH8iKzmTiU
	w/5RsaGieqOERfFtjsU524rWu9C5P0GqV77am1seynhEss7vPNVaxo3151Wf3ESg
	z2zicA+tEYu/iB/QSk8Q2CrOfo72BMRcw3Oe3yT217Elw+82lk0hTTZma4zNicAK
	5WvT9Pzu3bM7cbrxWg0zBZVeSW9lKYNJjGL3ebRo1C2q3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98yar42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:14:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2a3a614b5so544529785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580075; x=1769184875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iO9mMgKv5vMJGUuLtgYpU0c8RogSqX4J8gWx7OGRMYk=;
        b=LJFfrRz4hS3U8kcuRBHtWV40KNJIIYj6mDBpD6SB2OXY02eztlCHk/5KRG/Wcgw3/+
         S2v1KjTpAPh33N2jyN4IVd2OQLOegC45ZlvcyoPOz9lXKcQ18Mf+XsuW+DPS366uJmxH
         pQx+PersWs5kmR0B9Y/gezAmR3AF3wcnYgLsG0cteIWhG/IJ24WSbLpn8zmKoyni8VFj
         I4Fjc2eymf89HVEL6Qy69ORPOe62OvtX96vTyagSEmrwQt5ev2l8mG8A6istqHUoYvu3
         RHW6tVQbJWZP3XBYOPjiJr6bPNQ9sueNLPBWMhvsdWgFTKg0WperQSHPsD9ZkRviFGPK
         mobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580075; x=1769184875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO9mMgKv5vMJGUuLtgYpU0c8RogSqX4J8gWx7OGRMYk=;
        b=qHsCev+L1GVC9+NrjkXw21smOkCVRZWvMydscmG4qZ8/RWh098rxTUAxBr1SmCcB6E
         TDbdkqzl90esDiV+OqxtiCnSuuZPWr8IpaMh2ZXqt7wKK6Wl7m10zMw83XLTbTl3jYq5
         zqCz8wmdUh/Z8wfigUelTyatAUHLPy3pXaxNozNaoPd4GgR2Odsm/9kgkha9YvkqmGhm
         rHiIrojP3FaFgdUDl1UaFqEnRlsCN1F249Mcl3Kqt2G9e6h/zaA7i8TM3w3qYDvel/Tu
         r5/9YdD7OZD042wds/a5Dq0srXwviKUZmns5iaEbH2bSX79lAmW2VHsmqBT2hxHnL4Py
         crgw==
X-Forwarded-Encrypted: i=1; AJvYcCX9HDh3rGycI07b6tOk0rKFAp8TiV6U6p3i3mlXkfNl9k1s996cnYgxy7GOTjVjPrLYVOgi2D3+Ly3Mh1vr@vger.kernel.org
X-Gm-Message-State: AOJu0YxKeBC+vC5zeua8WxyS8L6i7cGW2n8JjlS+tVi1dcNnqHOECHwy
	VdYocq0VEkdPElOwtU68/pT73FrtH8dgzuZYJ0YahS5lJTD9q9ISpZMPA2NXac43U4zP0/J4oOa
	zXfN1JLvP3wivA3XLea9DOhwqrMoAHEvm+kwV58YQcGwqGCDgwCRinVzjZqOlo3n65XaT
X-Gm-Gg: AY/fxX6gAdF+A07rDG0b3VxlnlHsrIwKEeer3Zy+4Uq06+t8COww+F7WP8kKkHbrIIb
	CP077GfF+y8Z7xbRXqw9lknHrMDNCnWLzfNSPqeE6GQZ0ISZO12WKNhgREUjDoUTGA5qjzHr6pj
	mT08tskDP/8aTc45Gl/42HMo90kdV6SFPbgrgA2aoAjUK3jQcdbJmp5dD8eqKQeEQSwZglmDbG4
	/gkGwf+e4sE+dQClnSNzbxgstH9rCUthd7Vbfyh2uURXbDmkCO0kUw/6kWnowWkAJleLYdzeZNx
	pdMZPxVh6QvJHqzYmQABAab841A3PjRe1hHNrVmJwRU94v2m7+zvc7zFVYycqjO0nzxQdBABXmX
	PuRsryNves4XgqPxohOqcsGp/XJrJ5pMEkbhwJsKXljwP26w448kUHtXlpNljSMp6PDuWpuyEOI
	qE10WcLXp0YTe9kxvGbP5spt8=
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr875227885a.7.1768580073527;
        Fri, 16 Jan 2026 08:14:33 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr875224285a.7.1768580073004;
        Fri, 16 Jan 2026 08:14:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9ab8sm8728621fa.48.2026.01.16.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:14:32 -0800 (PST)
Date: Fri, 16 Jan 2026 18:14:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
Message-ID: <oj4saexuuty333jjuov3chm4qmrdv7dljykrw3d64qoeclbmj3@vsurv4bkad46>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=696a63eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=nnh3LCdgXL55amKsc48A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 5W7YnMPZ5gnZNu2rTki9jwIM_uvfXc5l
X-Proofpoint-GUID: 5W7YnMPZ5gnZNu2rTki9jwIM_uvfXc5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfX6GdW20wyDTOu
 csNWAEqgP21UlG+XaIgIaDuHNH9x+YW5V8dPss8luzU9lYagCoHnE+mAO5mNi2oL0Ju/PSNrpMK
 JqhP5eJSbuq7IUcbB6Ce8TTcJ6m9mPbVywIpMUZKKBQY/59YQpHJwCcn0qIZrVT755k8EHiFcKY
 cXnLI06GbWnsTKPQWUwDnehA3fK/+iGKFWMrEgFX6ZFI76oWpy2K9w8kkB2brLw+Btc+lYGORPm
 8XxqDNv80BDDWf+afvUProJNi7XfOCEkU5SvTMt3B0c2bHLo9zopfXhBZScE2XvdKw3C06m9ZcD
 5H7OXgCDJzBpxE5eQIsTXa8k5IHx6HqyYXHU8lxNKMV+ZThJUv7IvA/7j0gaue5dxOtWccH7Ats
 ix9dEzi0HEO8s29xJyLwnLCu5qray6R0dqGFHt6EwccTFP7PwUZT5I77YFYrNqbz/1K0uI4mjye
 Aa1N+8Jnn6WtS0mktKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:49PM +0100, Luca Weiss wrote:
> Add a node for the WCN6750 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

