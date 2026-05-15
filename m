Return-Path: <linux-arm-msm+bounces-107781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOU9GhX7Bmp1qQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D308A54DC98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17EBC30B304D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757D93CF04E;
	Fri, 15 May 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmBmKlay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfOAGsO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CA3C3422
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840732; cv=none; b=cYSabfcFbVqX+x8eEZLJqhq2ifZv+zzw7C8ijX+JbaIQvGyFNs8PPPH+OVJpExcW7S6Uqg+DxjwAom8dcofmv0U2qDDs//mCsgMjKZbXr26CEQM/yXX0+lkUfDCfLgcXHVXtt4xaJpYuFchMnsBs3t92XzEYnhhH5de6YSrZPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840732; c=relaxed/simple;
	bh=FIJBGrHTL4FdYrHCnRzSc0YOaWpM7/1dy9GeUxnVF5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MM75I8ep1Mj1Eavi+LhVi5TjJItwJMR+PvMijuTBLRGWrNo2cEvTodunzIjwr3WMFx69WJmehQ2x/XibMP4mz5u6tSu6p7f/9jLDJeqcBXjObdLzQgbvwRf8xzHso6LZvkRTRHMQDYMUqqliNl9iVgGmdIxcEr7y27cVitTCjvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmBmKlay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfOAGsO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5GvYH3198067
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zRSMmQ/Cq1LqIW/QrE3Bu/0w
	2K7GvYNa5jVkdlNAg/0=; b=OmBmKlayRNMel9mvbgdMIZEbSilGItVQXKMJueXE
	4oa29BqJbWUkUOK3xI80BzH7SG6WiDAuC39wZD8jCVTqHHbtEKgB7xlHQB13AKX7
	7aFuHh4DtTzWyvaXIr2ZF/YDyPmdgLExzMwPSL8vkaWh/MzloL4ogZ0XL5WKRuEK
	93f45x7Iv9XKk8QeeKWNaWAx/oFBlsjnZdUwPm6kfveHj81nPp0s3o/KaSjDNvTj
	SD9qefJdk4kLCvoPwbpD2MGnbm+b+l+tM+YqskX8HqaPa+NEnJLFFk3hpZsxEZ76
	A/4SXKFrthKn84w/iWvO7JJQF+hGYFyIaKQNX0j7hQdFHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qatsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:25:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0e3ad6so19654011cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840729; x=1779445529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zRSMmQ/Cq1LqIW/QrE3Bu/0w2K7GvYNa5jVkdlNAg/0=;
        b=XfOAGsO33lM4+D92VLqmsIww0yWc5xfJCqOVDd0zNFEAKI+bwCNn8s1Qm9WIi2AJA+
         hRoaCswqwscD5FXVqhS4+Isa/q/w8fLqyGy5jkaL2g2zcVrV5A4Kul9KbtC82+zGalKc
         GFnrh2brh1XDYDfqUs6BJcBgael9VNQeaXJBQ315LwTR6lxdgF6Ssq4AimzHz2JXAIq9
         886eKnWPGfTX0vxv/2ijWXz7luVoO2q9yVw5s4qTJ8CciQ2+aQRHs2PVG+B9ETe9cJf1
         ww9HoavNvI+DE4YO22+6Tmx9683CSizxuUxGoRmlQcyvsKZuC+siuKLOFnsv4c7XQlF7
         os4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840729; x=1779445529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRSMmQ/Cq1LqIW/QrE3Bu/0w2K7GvYNa5jVkdlNAg/0=;
        b=p2OlhUyzv6Fbj8VjkcJNBalFjbzebcAktIYeIwdj8BlI/aqzyKCkPQfQVu5z1l2EGq
         PGvePiIwh2/0AZi74IooHvzGXwTbdhMvpvi374PKa21mJ+RbL2bVuK9pMAguSwhqkWiu
         RSwx/d+Djgx7s/IwCmrIcmp3e+qkDWU32JAVdaZ0hulRTTywwVjbCMFUUfhd6GV89Hu9
         iQ/YYGFiyh8uLjm7I2ofWjA35xW0xpgBrBIei4ol6evi5fToeFZMk4wT4NHrTGhRTT/i
         NtJatrKXHXkXL9L+jUlRKh4NNnigOil80KNC0ChFNuCZ1am5SzyDEdV34a/kAvADzYq5
         CS5A==
X-Forwarded-Encrypted: i=1; AFNElJ8ezDROmrWWWw6MNzQDBTg9Qjz1tlllDFqFTpRlFmcvVbnYVXfOsuLEAqoZbkG1JqJZMfC0Ra+QkrBWnryj@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdETli7u7mQi6Xs8Taz+/Oy/vqyc2AkjtSyYoiPV/6AsH+gRb
	45+RT0CHwnrctmrBuDaE4nR2Uq0L07Vpwe0ekTAJBBqIJ7CF0bRppAlCgNLSelHC9uy7y/r7Wur
	GW9z4yi1YzfsKgbHclfZSF7VCnuC5oa43JIQc8ZK9CDfhwvPMtON3uKiP02xyyst8JJQ1
X-Gm-Gg: Acq92OHU/TOVlhNBrxbH5p4hPSZTLuQwjjzl8MKveJK2ERNDtym4snDHenGhnKOC35e
	Vlk4oyFy1gA1gQ+6gWLZKPkDUWJsdHCQjkifTq+yUqd6Ml13yYCVUI1haKv929XYoLNJA/QbTdB
	+qICQbPSZkOzlVBBcJlbWPklqaNE5hCWB4EuYUCUoHeNixCUJMnxfj8zkD9SQ6Teyhv0hanaA+r
	d6jwr2GhuUdqWJcIe2Flyqr2H22Tp19Pju513v0D/HvXA3K6B1ig6Nk8XEzQBcx97Mn6iF58HbW
	uHzkYXNHzT5DZTYUhoM94gvSMXztvabeHSQFSF+Z47OI297TfGEFjVrnD/ejRlMw7n+F5V2t8s7
	DmaV1yiICsW4wUfbJo8RichOg1ZeR68na3IiaFcdCwGx3Vs689KW7B3+H9TMpSP+/ZEH/Tojdx+
	96WtBsP9M1fpfadb8fNgm6k1LJzmWt9iWJhJs=
X-Received: by 2002:a05:622a:a90e:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-516418bb578mr75905881cf.31.1778840728963;
        Fri, 15 May 2026 03:25:28 -0700 (PDT)
X-Received: by 2002:a05:622a:a90e:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-516418bb578mr75905671cf.31.1778840728561;
        Fri, 15 May 2026 03:25:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c531sm1213085e87.4.2026.05.15.03.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:25:27 -0700 (PDT)
Date: Fri, 15 May 2026 13:25:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] interconnect: qcom: sc8280xp: Enable QoS
 configuration
Message-ID: <yorktzddkpgf3o64wgx67v3ti6an4z4o7yupcgo4hh6zfrpeey@lypcddxnocxg>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
X-Proofpoint-GUID: hUjDc3lCWmdN1TTEmoF6VlY3O4UWcWuE
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f499 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=NfFXuZlUh8PrNxB2MeMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX1m8GOUKVs55a
 EKez1quV8LHqWWWiYLpoNXd0g6ErNoakMA+c9CB+oBcylD+qL5SrbiNEur3GD5u2Ldb2tXw6IfF
 wd1Z1BMN7z3Abvh02Cqf/9uYhQyU9j4fXWJywEEpiNN/PCYKKS07uhj0q76hxh2wb0ptcGNUCak
 eKVSkMqbZPqE2KJAAcL1tCuY1FHS+biVEUvLwMFKYo4r7ongbcurWg0Q6jAaB+ZzxvQpD9uXrs0
 p02NWwlmOoszrS8IhVEm612oecSplhR6mkwUOCMJ+B1MyvCZ3lh+GeT60H3zRmYcuzcRCh5h1QE
 60IRyd83tct5d/+9hlLr2Wr0pDsTmq1rKdZz0sshXmvoF+V2Jlh8TwGyuDT0kzbHfHeCnBVHxaj
 9FnVlPQMCEe/zjYKg06gL2Z1X2GtyivYyK2DK9+VHqsbH031w1FPyqmpbKUB1Z0wlYkdQSmebNC
 dOs47YUiTKkn6bxe1/g==
X-Proofpoint-ORIG-GUID: hUjDc3lCWmdN1TTEmoF6VlY3O4UWcWuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105
X-Rspamd-Queue-Id: D308A54DC98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107781-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:25:13PM +0800, Xilin Wu wrote:
> Enable static QoS configuration for SC8280XP NoC master ports with
> predefined priority and urgency forwarding values.
> 
> Add the QoS box data for the SC8280XP providers, add regmap configurations
> for the real NoCs, and mark only aggre1_noc and aggre2_noc as requiring
> clocks for QoS register access.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/interconnect/qcom/sc8280xp.c | 356 +++++++++++++++++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

