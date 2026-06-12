Return-Path: <linux-arm-msm+bounces-112864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 61dFMX+5K2rHDAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:47:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AE67766E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:47:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gIblCZAL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eAB1uqFE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112864-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112864-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F75B3480012
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9B6397329;
	Fri, 12 Jun 2026 07:40:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660837CD52
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250003; cv=none; b=CKj7ZuMhpjjoqR/S1CjfRBc3kp0UjQVHZBenmp5SHr0HSV7JhuSunbz8MxnQXCnSkJCqDUXJnjLdcgq9YYen/niNw49jKPAAIKg9bsBWhImM/S/cy22+sTgOLvnXbNELRv4zujkthfftEcc/3b7onH3jSaqT81+WOC4b3lR6Qjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250003; c=relaxed/simple;
	bh=wRzmweWTsEmfV/ChG/585e8oNfnAo+XKNcaHI3K50VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJfiFS2V6+iJP68bZxJEZR7TBmnDRSxsPnSUZvyfgF/SEvMWYQUIQAUQwrnGEL72pbE3ddwQEb3ddz22BAt6l8wvWiXftfm2JsPdgwHgoXTEIMX15DkK8cQPkc+lcBEQNjiOjpAu2OlhU83pO3t6WJuif6GnW+rHfUV0teI//Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIblCZAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAB1uqFE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39cS12476238
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b51pKFTZa41NHWLB6gkRnfII
	61VCO8Fd0ha14432d/A=; b=gIblCZALD/G4JaBW1/GSXqShUWkn4nJV7hLtLYEX
	IO55SvSu8Si0ZZcSBG5j1kJElzgWitQdKTFx4m2aDQaY7zfCIYUySbkv9B3PCRVW
	6wYUPhuAO0xtZO7+CguCFesPRCnMbK2E5upl0egT9ITMHt6XDZZhDF/zBdyP99D8
	+sGbU2ZzW/7q9K9aBoCv4oiwh9/coooN4CdlPWzYU+fD2dS3HoS3bst8NUXrc+P7
	MNT69nK1d559ZLJ8TuWBaW/i38XlJ86Hm+5Cw3sm7i0vxKT9B3QGfboPjeX7ypEC
	j4aw7LBDVwPDxSgZUne9R7G18CgClEpHGMxBuyn9xEveQQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5t3ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:40:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a95e1250so90123241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250001; x=1781854801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b51pKFTZa41NHWLB6gkRnfII61VCO8Fd0ha14432d/A=;
        b=eAB1uqFE49+ytHdKwnSdQB9D9ZrZYEoAGXxQnC8qDQOgnaG7EB7N8XWWhi7XZSMtfN
         g3esSmlnSm0LjYx5wC7zftmeZCYY9psWERxgPwRByj9ufUZgDiAzTa+MDMRbvD+V5X06
         yr7qJiR63cGa7qndyJ+kaiPQuav9T8+ZgTL960P9Pinw9Cnxz7Ro+zDRPSIfHDutJbgy
         4OyQnBTFkFEH80oG211njYUqzs+sxCS1q2sn+qYUoySudOhbyh8KZUci1x53mB/fXd4P
         z2ZZFUh+UQtPlnKo7Dbw8sZj9kA5u9ReWTzr5RakgGXU+5jmUn3OL+zoeFb+gymLUzzg
         G0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250001; x=1781854801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b51pKFTZa41NHWLB6gkRnfII61VCO8Fd0ha14432d/A=;
        b=jJIH8Boie5vmiuWXJgsVPETEyCgw407HW3Dr2I7moSXXcll3Tw6IRqYbD6UT+0NI7c
         mR3UuFFv67TaKEqwKlSpOUr44iMOEgTfmGWlJxEKTbuUUZktnJ5vYzdWayiZ3wpQfhDn
         7BX8GIUSkBMPKRaawbLv4auo80+pdhNQa91r+nw/QwCEGfeb4qHpzCAkQ4KEPsdVQVQl
         u18TGVMjZRP17iwHm4vvp9Axcymb3Jh0gqHcny61m604A1Na+SooJKcZ/CTYHbdwvLKO
         JcPZx7LcVLkjVCtAhwbS5cAzUPPJ/LFgHvLLVT+5Z68XAiBsM0w+awjp99Vz6w0FD1qv
         AiBg==
X-Forwarded-Encrypted: i=1; AFNElJ8uhZu9fYbLy40rIqCKkuyNTQX1HWNL69tPJJw6HrmA6erA7IfyZFvWflNnEwMItBPtcMZhdbOMjZagYd6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yx75OvXrZyMj9aHPAcPMafJtgMK3CfOHWWdm97aOcE2uT2tzQKC
	bzTk8OENWVfFkcgktotj7/z7H/N45eLitw0KqJDQXaT0Xu0rIxZAg/Xb39AWVqyj0GtBL51jVD7
	VL3hfwy2WgDd+bKVnUg6hb2K7A7F4luHQqNU1xyBYbLq36mqT4B8Sg0/ANB0ncm477PWb
X-Gm-Gg: Acq92OE+Q/Ii8LIWNIlbKdjCYdPOy6AcpaWkkSzhfdvTH31xhNvPSlvSHkgXIZ1+Dr+
	yzcJI7IHqN3CJMRxtj+4TFiDdSZbBMutEu+tI9ZQqSPnp6m2WIXniBcadjlcw+bxGHHJrSXazOf
	qEHXP3XzW4j991wt+i/nR4UhTIvLhUXzOm7SLSQ3uzBqj7bWdbFaJEw4PAuqT7Mcs8VgstKXe3j
	wJI29X3M1jsSEYNsWV7e7wl64SZrZs2C2gJGx3UsrJQZGxYApU3vwag2jPXQDsGlYGJGXS8ZOBR
	zmj0Nv12Ll2W/9K+/uGSIN8u2rIJSIPyk+MLHLcOQ7s8JIswSqnXFfRy5UmLzthQraxToeOYAbs
	EB204NXV2Y4lE+Hfx+YX0L4oV+49YysxNke+SsGYstVGDDymiXXDWrH3l1NvCYlauFdU5ivKWrh
	BU2pAHjTedMjs4mBnuaSKcM6BRraSjNVPjsPk=
X-Received: by 2002:a05:6102:6a8c:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-71e88e1fef8mr501073137.28.1781250000587;
        Fri, 12 Jun 2026 00:40:00 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8c:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-71e88e1fef8mr501065137.28.1781250000130;
        Fri, 12 Jun 2026 00:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1ac3asm3978701fa.20.2026.06.12.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:39:58 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        md.alam@oss.qualcomm.com, lakshmi.d@oss.qualcomm.com,
        Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6] dmaengine: qcom: bam_dma: Fix command element mask
 field for BAM v1.6.0+
Message-ID: <minjqzjpe4t2yh6sf5lih7obw3hvd53dezjvkbzvv4bwdlshti@tpafx6ubgnyb>
References: <20260611045757.2841252-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611045757.2841252-1-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: InslimkH1BaExQM4ib0aso2qeOSwIk8A
X-Proofpoint-GUID: InslimkH1BaExQM4ib0aso2qeOSwIk8A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX+JIdxfuJDYku
 SEIJOBwz30nVsBRZJmj5X+qqR6+Jfg8nQ+KeMbL2bU0qCHBAXF3RlJdRhVlmn3hHEMp8zRJWEsU
 EF0y0lIZrCMQQmEvwHb3yi8E2RRcdIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX90D3FkPBq2QV
 vqOlIzN7jvi7NIwPMelik1KfxetIBGoT+S/YPHIlUV5OJBfhx39gRAzBB7739KcDDWVfOHNHh+n
 KeuVTL7CFL0qpLAEXP9V2EJiK6JaqPjx8o86gIRxvfzY0s1wfr+hQ4BNjNzRVU3fr0DM9eiYkyq
 9OByXvv2ArkV9zuLftgLkyVcYOkfyVrvjFECPgMK6CSU1OcMj7DX2K0HnFx2GyFzya21suhHnuX
 5dKMMNpD9SAW7MNUh5iuQGavUBuemb0b1gPkqeY4XUVCHcyGFE3oGmYEa5JHlCrhiWN36o3RYYg
 Y9pJ6VLSJamKY/mBdCTl8oJoCvqu14avYPvi1rzqQHPURNd8/4IRAxWIjNOw7W7e7DRnFAD1spE
 n3Ebmvcdgy/wcXK8SclR1wGzt26130U04c+ND2blxp03uRoFc0aXVIWQ4ZNGYoUxhNn9bFKi5MS
 +hb7OMOxs0BONv9rDTg==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bb7d1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=6DVrzdH86YzCZK8_rrwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112864-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:Frank.Li@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:md.alam@oss.qualcomm.com,m:lakshmi.d@oss.qualcomm.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 124AE67766E

On Thu, Jun 11, 2026 at 10:27:57AM +0530, Varadarajan Narayanan wrote:
> From: Md Sadre Alam <md.alam@oss.qualcomm.com>
> 
> BAM version 1.6.0 and later changed the behavior of the mask field in
> command elements for read operations.
> 
> In older BAM versions, or prior implementation assumptions, the mask
> field was effectively ignored for read commands. However, starting from
> BAM v1.6.0, the mask field for read commands is repurposed to carry the
> upper 4 bits of the destination address, enabling support for 36-bit
> addressing. For write commands, the mask field continues to function as
> a traditional write mask.
> 
> The current driver sets mask = 0xffffffff for all command elements.
> While this works for write operations, it breaks read operations on
> BAM v1.6.0+ hardware. In such cases, the hardware interprets the upper
> address bits as 0xf, resulting in an invalid destination address
> (0xf_xxxxxxxx instead of 0x0_xxxxxxxx).
> 
> This leads to failures such as NAND enumeration issues observed on
> platforms like IPQ5424.
> 
> Fix this by assigning the mask field based on command type:
>   - For read commands: set mask = 0 (upper address bits = 0)
>   - For write commands: retain mask = 0xffffffff
> 
> Also update the bam_cmd_element structure documentation to reflect the
> dual purpose of the mask field across BAM versions.
> 
> This ensures correct behavior on BAM v1.6.0+ while maintaining backward
> compatibility with older hardware.
> 
> Fixes: dfebb055f73a2 ("dmaengine: qcom: bam_dma: wrapper functions for command descriptor")
> 
> Tested-by: Lakshmi Sowjanya D <lakshmi.d@oss.qualcomm.com>

No empty lines between the tags. Also missing cc:stable.

With those fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
-- 
With best wishes
Dmitry

