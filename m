Return-Path: <linux-arm-msm+bounces-90382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEHxKprJc2mQygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:18:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FE7A163
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6E433002D15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174DF289824;
	Fri, 23 Jan 2026 19:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7kGgDjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdwJaidv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490731F91E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195922; cv=none; b=LJ5hL2Nbwkzj/+10/rvPg5I92uMhqtntPxlEubdDI6r+kbwyRqWi0sqIENi1vjAIcP26t7sKGxnFdJ32CMX4OUgOE0tW7TwXL40Agr/u7+r77bxtBKEyUDMHJSooBOJaP6GBgaPM/rBgcQCsLTpoJeiPp+g3KK33NC1W83dTntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195922; c=relaxed/simple;
	bh=ueOS/CjOndEkDwZzTX9hBzD3FyQPNBUzVSWENVtt+UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7GOKkYMGGxNiakUcxZKPkwwf8AzygGz7d1dhlCYwkxIjF2qGk7U4j+XUGXuZ/+qOPyBQ0HAYzpI9i8PTNdiLZeliTXvxcBlyzWWC8Zae5vqDLYQPwpBGqwKuUVTX4ySiK/SjNPcCnATTyKSgCwjJ7+9i0VVoJvI+m3MId/SS70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7kGgDjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdwJaidv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NFUqOv1848614
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w0KZMnh/DWR/lpOvZ20jorLPPBptXzTStJthYI64T8=; b=m7kGgDjpTokoQDpm
	DK3+qMBxYn7CmwPyuu5EKW0D4IXpdt/3NnyDSHqKXJpaSPAOhtvmUXRxclAvkjkF
	/sgNCLzvFMMQfrRuHCsWpikSlABbvneMy+iPUrIzGnxjbk8XejgGBaLJaqoM6Hxb
	VhAonJBbnfhTZf6odPPzHV+Wo594iWIcIninlcnMh1FUvx4TA5puHDWOSfTtUNvx
	v8mQKWEi7ef8lygG0s9YXewhspWt6hnR81ip9B9bI9DKg33A71ScPgVRQIrylBh6
	/vJGX4KmfjYUZHv4F4X+pfeb/sDEusHoOagnR0fsLzEZYaoRtQjrT9xar6aUwkKJ
	1MjXiA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvbpn0peh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:18:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9426773a207so7774596241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769195919; x=1769800719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+w0KZMnh/DWR/lpOvZ20jorLPPBptXzTStJthYI64T8=;
        b=bdwJaidv5vX/7Oe56Jv0U7dFtqHkUGeeXyMBStxvKPlatoYYjE8YOMIAGUf2H45FT6
         6EVRpM9JzLhcU8jD3el+4AIOHZZcGBJKfSN3LNpn2YsXTU/0CShU0Uhbrc8R24VsFCUp
         Mn37NuhssP2DLOpFtnxB7YZcxKlVLocd36E8klUsjj4c6GPNUK+T7aNplHdmgAY/vMx8
         uu711sSrlG66qQZUKeEdPREtCGWs0cQ36pDk+X3qpKEBBi0PQhbzjGdLQjA+p06xz8t3
         J/c6SGs7s2HNsUOOeu6ouz/PKnwuaIAAQM1uDlqC1S3XTP+l20BUFMWoIEj/WG25i9jR
         5w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195919; x=1769800719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+w0KZMnh/DWR/lpOvZ20jorLPPBptXzTStJthYI64T8=;
        b=gpWpB5Vczvjs6gFIX/wcmDf9kSQBnOQA2oNPLP4lQ0Qf2OOMcZvE9ARi2iqymuFNBg
         ERC7wsy1iQSOnKtFPHjIAW8ssl4NdMd+0oqqBGKVFuDWNEaHmHbhGX4DxKw6QkMaKx17
         unr8w6SufO7y6/4GjQQUhREG7+THGuPNVUA2QAWxLLmDnMfVC6L6XYUwAlcHbJkpRvTA
         D5ITUxzKM44WGhoCjnoBMFQnnUZW7oTDQm1nW9CJgLXUtgmoeZshE1/W89UX73sIm+bQ
         M8LVE27x/93ZWYH+y6Sn/44Emprn0NifiI0m4kfGKdyKcOtxcngPg4d3vktcP3/2zoTV
         e6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUCqmyU5QWe/7/EbyPdYuhzurNiAD7Gns4jjIODCe9JSPLJraJGc14RcrYuBsUP93bkt9qZ1MOcHUm2yVGJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6OERgbIbYUBWCA/ONRLIN27oKTuRMerV94OhqNvjGot1rIGBV
	q2iaNTyWnoyk+9rQXQrMXTLuBj0QiJD94nBqJz1XMawSbRoL2Q4jGrgw5VCDnukTe3n+kgs2j5J
	pUMP35aFLwA4FhkkHy5c2J5+Sa8zOTROuunu5nWVbVbmYxQQKLHg8aWL2mzPrJ/thS38t
X-Gm-Gg: AZuq6aKT89Qn0Ne5AdmwdrcVz8ApEt8RNdXRH8FmPNZTyb23Zw38xGTXhtM5OaaFrbz
	bb4+IMIYfBd1pI5FlsclPcKHjVP5jTtV1srE3crPo/iUPPQdQW4f7HcyhGm7fg3FCnrjDAiTHFM
	AIkGXkj4rThlhz0UK0tt0hHp+RAORz8KvnA+Z1afb8XtqF4OSWrJBtVkfBNC3fVgxWiDjCPWS12
	vREDksApLigbDgvhS2o+RPVWeip5Gr6o7yOFeJbMag4IwrC1WlhBlm7C2kEDSTAVoW6EFU1CUy9
	7/uRvMXforAfWoe8JaxvlqFK/QhBXTVpxyxHXcBvmKW8E4kOhQ2ETVuNOlgZ29rAV1+Kqo3e5kX
	3kdnvDCFAYKLcTuvw6an7tvQJBpr8Ym4yBziLdbeat0KUiozsLIvHahxZ704hbPZzsw5rLrCs8y
	4XClTjmRA/c/C83JJyqUyo4Fw=
X-Received: by 2002:a05:6102:441a:b0:5ee:a083:7935 with SMTP id ada2fe7eead31-5f54b9d0e63mr1422189137.1.1769195919088;
        Fri, 23 Jan 2026 11:18:39 -0800 (PST)
X-Received: by 2002:a05:6102:441a:b0:5ee:a083:7935 with SMTP id ada2fe7eead31-5f54b9d0e63mr1422175137.1.1769195918480;
        Fri, 23 Jan 2026 11:18:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492c2fcsm877399e87.97.2026.01.23.11.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:18:37 -0800 (PST)
Date: Fri, 23 Jan 2026 21:18:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Enable ICE clock scaling
Message-ID: <cb6g64efyoauel34hsckp3kwfprw7etag3fthqlkucz4ue5ytf@t4gejdalvvow>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FvcyyaOVdODLda2OBUCHnSN66dqsGEGH
X-Proofpoint-GUID: FvcyyaOVdODLda2OBUCHnSN66dqsGEGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0NyBTYWx0ZWRfX0fqcAyBYXEmw
 tUzFfdEJKJRnswz7nNTg1RKcr5lu1WTakjul6oATGF8WKZuShtLjwM5JhtOfoooAUuTdRmFXr5+
 XdHpjlTuKFA9Gq07/EVviRd2aYX06o05kR5a7F0i9BOMVZs4Biyf9X+j0GKKirVQ8m+pAj4fEw3
 1Votq39RgzclGKkyvApS5olsikM6RT3jnFinJyHqnsA2cqIC7VGfkhP9YzJ3PHGCTybRLr+rbac
 zWuhk/5eLToSDm8ESiHU6xfoBb3dAJvIaegKxpp3xFL/GgbEHPfUrrKQjWv7iZSgDDTSGvvMu/T
 wtyrLmRj2z5RUQvhAY5mh05A+DqAmi/gBh7eNSvkPVtQZNgpxEEtRMLTkE/gMEFuP7Q/E8fFw+X
 agUNrHEF3pPIQGQ7VqrsjlD4hxJPSScw4CJ17dLnn/Fh90PZYspSLAlddz5csGI2COWzQ4ISTz5
 KX47ibmkAHFx6WB4p3Q==
X-Authority-Analysis: v=2.4 cv=P9M3RyAu c=1 sm=1 tr=0 ts=6973c990 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cmxkgl4FijiPsMXLri4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90382-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B67FE7A163
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:42:11PM +0530, Abhinaba Rakshit wrote:
> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> using the OPP framework. During ICE device probe, the driver now attempts to
> parse an optional OPP table from the ICE-specific device tree node to
> determine minimum and maximum supported frequencies for DVFS-aware operations.
> API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
> controller driver in response to clock scaling requests, ensuring coordination
> between ICE and host controller.
> 
> For MMC controllers that do not support clock scaling, the ICE clock frequency
> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> consistent operation.
> 
> Dynamic clock scaling based on OPP tables enables better power-performance
> trade-offs. By adjusting ICE clock frequencies according to workload and power
> constraints, the system can achieve higher throughput when needed and
> reduce power consumption during idle or low-load conditions.
> 
> The OPP table remains optional, absence of the table will not cause
> probe failure. However, in the absence of an OPP table, ICE clocks will
> remain at their default rates, which may limit performance under
> high-load scenarios or prevent performance optimizations during idle periods.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> Changes in v3:
> - Avoid clock scaling in case of legacy bindings as suggested.
> - Use of_device_is_compatible to distinguish between legacy and non-legacy bindings.
> - Link to v2: https://lore.kernel.org/r/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com
> 
> Changes in v2:
> - Use OPP-table instead of freq-table-hz for clock scaling.
> - Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
> - Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
> - Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
> - Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com
> 
> ---
> Abhinaba Rakshit (3):

DT binding changes should be a part of the same series.

>       soc: qcom: ice: Add OPP-based clock scaling support for ICE
>       ufs: host: Add ICE clock scaling during UFS clock changes
>       soc: qcom: ice: Set ICE clk to TURBO on probe
> 
>  drivers/soc/qcom/ice.c      | 68 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.c | 15 ++++++++++
>  include/soc/qcom/ice.h      |  1 +
>  3 files changed, 84 insertions(+)
> ---
> base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
> change-id: 20251120-enable-ufs-ice-clock-scaling-b063caf3e6f9
> 
> Best regards,
> -- 
> Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

