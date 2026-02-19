Return-Path: <linux-arm-msm+bounces-93337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLpyBRSzlmmRjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:52:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F31A15C809
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A95723018D6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE5C326953;
	Thu, 19 Feb 2026 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/IFu0ul";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wzo/8x8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D96326958
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483910; cv=none; b=eYxnqVSuKM25qlkxFe++ke8V5/ri+bz1cpxh14zifA5GjWIP2x+H+yActR1dCo3PTpakxVy+w/rokJzJuF9S5A/FHAhglu/qfP+lva7gl7POkyfXyw0KElDlyyq9t9ZDlDnTgLW2zF2hvtAg7we9chQ4tEnUh+U9Wt9jnc3SFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483910; c=relaxed/simple;
	bh=Roy+dUxDkK9IhvPFs2q7bN+N+GftZ4twZcWH0mWybvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+j05TSUNfOmihcGgAXusWqTNhgdipwS9FgnlTrNdmgbHI7iu1+SPcrhvOT4NuW0w+wGvv7ap8Bd/jAYXCUf98gD7Ss4YQ73CTY55llDt8Vrdq1KtEhPNeIdJKL+ZO0+mTdpWyIw3UDCo8NDw+POJf/367u+1e1bHQssKBfi4sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/IFu0ul; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wzo/8x8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J3O7K34071917
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSDnkDf0KUOqNWkf9I7KbQ72
	TxHasUopsazL882oRd0=; b=V/IFu0ulX9FOU8qANFZeWm2w2rgzeB0Fs/2WJsk3
	3ZLKBAUBlN6F4xXuKx9401EkoujrrU5LYh8oNf2ipWW/OQfy4jFZt9shgKwr7oyc
	V3eONTAFNXATkp6TB0sHezt1GR9mKH0RHObFLeZadXNGjxND4TbBPwsfeP6J+kGe
	90weIQcuuWs8MSvdKnAhMibZyw/QO4EAlPnbYNGUlzg7q+5WfmnFPzB0x6S4GFYx
	MYZGAj+jD/AiWABgqAdBYYsnTfnv1vUt8O9jPVZE2skL/x6PYehLgFgGY0GvLsk+
	ZQ/y8CZLLgcbD8SyXwZtzGqajMwuOMA0mq2Kx3JROYVWeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdtjy0c42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:51:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so85142385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 22:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771483901; x=1772088701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSDnkDf0KUOqNWkf9I7KbQ72TxHasUopsazL882oRd0=;
        b=Wzo/8x8te7ncHEpggn5rLyCsur599vGInCE/vH1Qm7ZEur9f5sANkXtwE9CLbrjKUI
         GL4hsl7cEm35wU6k1nkMXnl2OVzpUBHmFgKruPPRoRJUJ0vR4Pzhi9MA2bP5X1ZBSHmF
         NgeWfOQJvNsVJsZ8Zs2rrFIuiEhlmO8Dtx4IVeefRa7jwzZUN6E+ziXUB0k0v00VBjas
         kgL+BYxg35j/0cS69YJbhPr15H16dASz1lxQcrJ+kzkFl2ZqV10UE+CxKBjg8H8np7mI
         ODhl9DsGGqP+D2CMMEJUDfrR4AsNLW2KdE6JRxKwkvwkPxW8AQJ3uyCEl+IOBYvcYqMU
         Nk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483901; x=1772088701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSDnkDf0KUOqNWkf9I7KbQ72TxHasUopsazL882oRd0=;
        b=jDnUqAzxzprWDn9hdJY+Yk9VdJvuU+GMezQIRgsgyV0jkAXhQRq57/E/W929Rzd+u4
         82voznCmZKjuSDRO01GM8v95N/HzFP5kpTWPqGQFULnfwhUkLjoeJ+2qQqU3coSJ9agA
         bWd1E+EsVR/EH0fMRQsbN2LUdlLwKkvSfVXf6drIJh4aJvBb4uhccSN44uZWJK3YHD9+
         yRzmP6fcElaV+sD8UR5t7ehxeoZf//kgyYebxwNvL5FjMuUcsJoCkDMMjfsAPRLXhPi3
         6cNZD1IbSnMxNCe1+M8wuMCBknmcfkbJ8OuZfJBua7Qq1UTmakfXwYdfmj4ThLlCcxdd
         7GnA==
X-Forwarded-Encrypted: i=1; AJvYcCUqOhSPVyt1eBrbg+SoDq2jEBVKArG3P9z4PHCYvV0Wpm3bBOMfoOWYB6O7/vVCY7VKO+2N1W8ZYEtS2+Ea@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWQoCOmuO5rEnW/AT+78m/V/DaORCI75bri+WEfAKBt1/YH+/
	7eZ1oWuvIPr32wuJQ/XkEvRt2GYB2YiYud2e52w8Km3Sp6kdzqDRXax7h0/N2bktaGv7UoxDTSs
	i/Wf8wOLisWEig9wSHE9mXyy4bKA7z7cn2EyyqD2SnidqOQ28/jkORC5P9OKxwGoG/N18
X-Gm-Gg: AZuq6aJkjrYrKTXin0qp+CcwaBPggXVTHBnNq+2IuzlLVR3WI7Jft4D1sDiSj9FMJj1
	ICyLXfv8AJuWCW1Q8R6D9HeTJyjt0riLax0ShoRQ+XnVjfwNPQQoWxgFKbmcnpnMOzahwbz9MAO
	Vf0lfU+1kNFCq8k/AzyOUNwI0p04kbQ2GSfadWczdrcBr36DXvDEsFHd3PEGipbl2cD30aJIcwO
	KIKDhLCqh5+PBHcS9hDx+a+kPTcYrFQcT/TCgqxE2q45bhuq4p7e2Zl/plWGOiXHkaOlvPNNU0L
	UuSGI1ig14HY2d/JqpASjTm0Z4CNEaDvqpQ0wCaHEKkKor55Idc7k1HJN6KhiugdXc9KQw+4mJb
	I6AdV1XjP5SLonDn9uGAC77yUYin/z+esQJyxdO66XXFZ8AgWniTRUMxg6asHem01uX9EHaZ+sC
	mOn7gPbdIUx/zX9AUBrvIzj5uVoU9KedtT/aw=
X-Received: by 2002:a05:620a:1a24:b0:8c7:f79:bd7b with SMTP id af79cd13be357-8cb7401cbb5mr426206385a.9.1771483901266;
        Wed, 18 Feb 2026 22:51:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a24:b0:8c7:f79:bd7b with SMTP id af79cd13be357-8cb7401cbb5mr426205585a.9.1771483900768;
        Wed, 18 Feb 2026 22:51:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f8dsm5141998e87.49.2026.02.18.22.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:51:40 -0800 (PST)
Date: Thu, 19 Feb 2026 08:51:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: msm8998: Drop redundant VSYNC pin
 state
Message-ID: <667woowm4dcbsmce6lds7jk3r4b2efs6kk5rkjtotkzsc6grzh@ps3uf6wrzq3w>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-2-2799b8a4184e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-2-2799b8a4184e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MSBTYWx0ZWRfXyP/vUTZY2ki+
 6MDX/aZNXH3J+Uf5i8xqC8FklhdyzWHGrYe4Zh26btGDsDxkjCbHDxzTRacWLsA+61f1uBBZTb+
 xN7KJsPZh3G4Y6c4LQ1J06kyJnlgCElsFQhqlMQ8ea253XFnFkJlKQqpCzG4mEGZRcTbeP0+An/
 DCbIVXSOB6TJTUaqCxdEPoIsExEgB8HhMreikpJEoYiiO/wk+3+l+JHD0Xd7FcSu69hWzLtLlPm
 gKcw0cHEcvnNooq62tsPzGE/Jqw3vVKGbkiBZSjwADhuTraS2CzDhrbNlGDuxY/dF6Xd5KsJdT6
 UySFzVK3fSa5c7vFlYlXrRPLC+8oY6xVsKx22rDkHzH17cGAWnDYo6j92YhFticSiTd9fvAz6E6
 K62TKwzF3N6usMSwxNSUPPJ83Q8qGEJfohwNgGsc0Xfct+8M2v1tZpVFVar2W2XyEkijGNJYfxj
 1Tasn3829oSadib0VrA==
X-Proofpoint-GUID: HeqMC2ptllPGya63x5RNXcRLW1hCYgmV
X-Authority-Analysis: v=2.4 cv=FoUIPmrq c=1 sm=1 tr=0 ts=6996b2fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=xwFL3R7BSttjCcsnrgUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HeqMC2ptllPGya63x5RNXcRLW1hCYgmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93337-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F31A15C809
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:24:24PM +0100, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> index 0cac06f25a77..30222f6608da 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> @@ -543,14 +543,7 @@ mdss_dsi_suspend_state: mdss-dsi-suspend-state {
>  		bias-pull-down;
>  	};
>  
> -	mdss_te_active_state: mdss-te-active-state {
> -		pins = "gpio10";
> -		function = "mdp_vsync_a";
> -		drive-strength = <2>;
> -		bias-pull-down;
> -	};
> -
> -	mdss_te_suspend_state: mdss-te-suspend-state {
> +	mdss_te_state: mdss-te-state {

Seems also to be unused. Can we drop it?

>  		pins = "gpio10";
>  		function = "mdp_vsync_a";
>  		drive-strength = <2>;
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

