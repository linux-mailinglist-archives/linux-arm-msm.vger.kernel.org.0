Return-Path: <linux-arm-msm+bounces-100624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC/BNXFTyWnrxQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:29:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA38352EB5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB208303C2AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E503806D9;
	Sun, 29 Mar 2026 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LH4yN1xU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abN0mbML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C77A379999
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801634; cv=none; b=XytvwCn46m/77YdenbyWnGfXCSSF15IX+L54/36iE87YCjm70nwsO9pehun1ZibzRVxD9o2DrTNywGkInJKjcILW9NhfM3Ziv/rHOIa6RLkdDRUYk0pIA3z9bFQ1eqDZ3H024cjqJHuItwB8sT/oLd51nrBE8gD9aHlHqCnt59E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801634; c=relaxed/simple;
	bh=xlO662m0unxoo5rjyx3DFIhOEQX0knSmHVlA5hbLlKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8XMbKN1gacI7c0pa0pLVcm7++JcD1C94SKRvSFh9gjhdTG+rDkHwDgvpgKUi2Gh5o9fCC0z7vaSpCLfww0Q1EnEYPcUqfvQh73mNvm3JHaVhzjHFazht7+4sIIFvDtn3KUUrGIZZ3mR2QtHIf0iEZ1hnng3MnVE1Gb/8xnX4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LH4yN1xU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abN0mbML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhOde811988
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2DRZhCEGAhiBuBP1YCe5luWO
	TveYo+3ES/uCRfsSr/U=; b=LH4yN1xUjGDj4Crv4C/8ISiVOaWv0I2qSshRYCPu
	gVSDiIq3RQ1WWt/rZjqfmoOkmG0FnZdSkBOpuWhqmVg/CchnULzkjGOBgqtV+Sdp
	hmNDBcxDNLtxRu+2sbXcWglE0EQYjCPJ4xy/EM2jO3QG3SvRQ7/zGcTIXhvCKad2
	owC9hl/9rrJ7sGlClsPS9yOp8vZj6YMYxgT1Q28ct0nWpawKFW3rxw89BKoelQm0
	DCczyUmhqSCj5P6F5sTK5Js93VkiTii+LlvBhlctBV+jRNbpxrUCA3F8Sr9f4S1K
	CfH7PkzDd/XgRDvCWdQWjspoROOv6E4RU9OjCTdOdv32xA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7b55s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:27:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso46264371cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774801630; x=1775406430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=;
        b=abN0mbMLI2Ul4k+1JlPXqKNwyfx+0VeFw84+g0l4JTS4jtbiMib4WHdpZYWZ/4Lid2
         iM42L0Hxp/VmjGjYPYxjlCksEJAUJHWbLLcy10/IzmZCjr95UemdvK0lHSOfWs9y3UhQ
         PUQL2Tt9vayzuLekBc0IifjTQfkdqtVtuID0fex0vNfDPj2JXk2VA0IIXUB3S0PgwX9m
         cANiR1kUY6OmAIk1v1OCi2LEdhbFFQ6XiblkpYN53CksMDOWM0rnrrHz3G3KW0+NYlP8
         Nauo0W5od3v7EGrNwrhcUO9QtH8l825o5ld/MUS1jt6OY5Zu6vHgAWgKKf7bOSZFlOXi
         AnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801630; x=1775406430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DRZhCEGAhiBuBP1YCe5luWOTveYo+3ES/uCRfsSr/U=;
        b=LOApNqhMzwCT6WJ0TC6xnL/ta8M3nZvmgc9SmE4yqKj9qgv/Q36FI2jTA7G4/7Vo31
         E7QWs9X50nUEuc1Qo+E5bBINSi4ItD5vZp31jg4Ttj+L9adTMdfJTs3uwEageAsQBUGT
         k/gmwxW/IZTWA4Bsz+glP76ZRs9WxO6K7sLxgkig/dtDuiD8iWtU9eIxT1pwFeHKH3PN
         tsxIMex+iUuh3vmBHea1ztq4PXP+XnqoP5NdaUoGoYNFlKYegWtF05V4jThli4eojJ19
         0eG1oyyjosqJL6eWw+uop4kvl0CW10Qa8vgKTI1bn/TOSH3Afcz+F0njhov70w/bLAu4
         54fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtyDeGpD6P0ofie5W8X8jsKznV0bwZDNyd/AaDhFnfsAkt3kH6P5TNlYfu0wQakIvup9s+8ODjwgSLckGg@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxyAY/Jw7FI2JTSCT8Val+99FY5y4YCMxYutUNAgYRRNjbIVc
	C27t+SxpqLEvx57fcSE2dgN2LLhGYyyrH+5+Odeh7yu99LdnUgh5GYkGiKxw7vSaQZhTFcgi52I
	GR/5+AAEx2fgOZ08xwqRDMuPaici+Yf4uLZvcljWbQ3llaDWNKHYWPF0W019vRHunYx8b
X-Gm-Gg: ATEYQzycOIy1Mrhp0vxTP1eBieHOWpvmoKDOMXcKOHIMzg50lF9nhSg5OS9gqmzjNZD
	bOACv+Rj0qWDRZKA1SCFLcVLLWvKXst/m303XjcJXpIVPhwjXofEeFjH8j9/Z44FAXFSx9Y1B2Q
	Wn7fdqZxL4JoYAwNWNQCEQOsO6JUI5bpXabPiK9bsJyvH6Xii7RrbslQC3SW4J2j5m8mvc/5xUU
	Vbq+4aWgZ+9awT5/LcmuU4Tbs38vKYZOhpTYnLzihP9bxgtfRw9k/qYFSSg6X7aJk4gQ5jKngd2
	XF3UdJiAd0mGuE7MMjwVZeGfaVH/loq/sgh46taxClgYfSiAHqiNUjhPiMR1XyZI1d2H+oLp7vl
	e/NZe+NCQVT/c8s8WCe2P20VM6LMpKsqeep7zQxezsRE6l1ZL5hZtL0z1cXavmM3vIIy/e1D+/P
	UkoRJ9IyF/TBf9S0iJ+JzoODSzr1+AU1RXPww=
X-Received: by 2002:a05:622a:4d4d:b0:50b:26d7:eaa9 with SMTP id d75a77b69052e-50ba398f174mr111884931cf.64.1774801629993;
        Sun, 29 Mar 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4d:b0:50b:26d7:eaa9 with SMTP id d75a77b69052e-50ba398f174mr111884651cf.64.1774801629485;
        Sun, 29 Mar 2026 09:27:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm10059401fa.21.2026.03.29.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:27:08 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:27:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
Message-ID: <iudca2llwe7dgisilievlwz6t4vbswfywmz43v3oski5usbvxo@ll37ug7adaoe>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c952de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=I6QQIrWB-BqS60JhQb0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jNQJf3TkeLllMzB8LYO7v_XXQzc1vMCY
X-Proofpoint-ORIG-GUID: jNQJf3TkeLllMzB8LYO7v_XXQzc1vMCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOCBTYWx0ZWRfXx8BaQLVwQLSw
 YGogGaYyb0UDI4lGO/Z4NjEDzQLf2Ir/8nco3lQv/TLaQ+CUaaxRbTWHmAie6bOzAyItdqie/m3
 yNdgowHE91F9+ouMZF/UBAJVFSqI0LYSJdkwF6n78FHY279LxeLQbLJ/sJ28OUUzUH+hOHSjs2b
 hicNk8fiN0IFVCQAhtzrAqucSKPXLjCkdLoKc7y0Tw/Cwy2hpehje8TuhJo3tTckfKcpioKYVIW
 9rrV1Ail1NYz7cib3li/W6ErCyJd4U+a+VEvOVbxUCVh6O3vZplDNb0uLcwxBmKobxXGE5c1drV
 pl3Yj0xXEclkstPPdT7zQDKSLgFuEYAWiPq+iICU9IoVQ+2s8z+/2D6prfCy5MLhR+Z4qM4zNHt
 DAjG7lSFPNos1H5i1pGHE4CDHEd6RIxAAaspd62fgwz2oEBhozgoTOg+qd5eQTcmuAZJEu5qgYd
 ppN3XT8PRJwmyNnDl9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100624-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DA38352EB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:57:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> The Wi-Fi firmware used on Xiaomi Poco F1 (beryllium) phone doesn't
> support the host-capability QMI request, so add a quirk to skip it on
> this device.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

