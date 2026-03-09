Return-Path: <linux-arm-msm+bounces-96262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEsPGvnBrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:50:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36923928A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42A453088220
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB4D3B95E9;
	Mon,  9 Mar 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9lrZbJ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2WpKL7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3343B961A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060341; cv=none; b=TD5zVTLQZi38ZKhrca0L6zXN5tkJK3sK7a7ww2+yQDM4r2RY6+x6i7CbdySYmo6y6lB7c7qz0Dbpgc9VVpKVz/EqqZHkdTpjbE12Sbns0vknrZWXxEBQjTR14xwiDNOPNKQ9xoIZ+9W6YdRn6N/relZcU4338jWvwJO4VhpdwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060341; c=relaxed/simple;
	bh=VhvS3kM4wD53xo2G0t/yIpIk2lXGxjaW37wBLGd8sA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGw6iM3das0URhUT+vxNmJPK/JFaXIFYMHwDQRrXVhXJdYUN5utQCShmhfsU/2Mpf6JPklV37i6aJV3nT567S9cz9HlshmV4NkkzhSZhoBd5ZtrCftfNIsbp2niHWbvASGVDzHqmWTqQWj2PiQhdiyYnNE4cEj9mpkoxljqHBow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9lrZbJ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2WpKL7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297dQMc2910558
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meRktTehSj6qBj9CkXJ7Dg5Ap2sMKM0JeMCDAVB3Dsk=; b=I9lrZbJ5xuE4yeYj
	H/sCiQNl0nUfZpgLWT9JqRELJ07Hcm9WuzxYVQ4Dwdz7LUe5mq6TknrmjiCgtnvs
	0vBOj82WyQh3TufzBVbPbew0ajciS1IKiaLww5aCLY8CMdJ4iTyvPufe3KbB6ClJ
	ffjSdhD+4VOW1V3mKDeKH/mYzac+1mn9kyb9uMc52GemP9Fn4AU8p4VnKbL/4eWi
	ahQttQGO03n84ESAbT2v6eEIvl4IFlEld13wjSOqjLlDxDPUydUQqYUWpqkX1vGo
	i1jeucpxKpHYr58fz0cgeuOKaUXi1HF4WTVduUJNKYWywfxihXKdkNCQGC20IjFr
	Ip4pXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83dd36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:45:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7604c6a8so145558585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060339; x=1773665139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meRktTehSj6qBj9CkXJ7Dg5Ap2sMKM0JeMCDAVB3Dsk=;
        b=E2WpKL7lh4mO64XisiQvpSpx8Cmv9oHpfyeUYem+KTa5Upe5vPTz8jIohfzshvimKB
         /fvPg24wfRhkkwdFICLohVxGuCH8JFnIYOo3j86+KolNUqJfsNgOyXVvMW3R5AvtgsxW
         H3dXunXU45tgNFEGRIuJHgpiFFI6uLG4Pz0pbgU4iCS+SD8BHtFe+e3TvPMqc4F0QTm7
         hIjR/PD5Edgdpsjy3s2Ye7Vs3ntKQekjUlaiXg/NNquoDndhZLt/6ygxOv23w64APccr
         IjjXL6nodj/MDP8oKpiWXXoEMs7VzSd8tbAfCSR+PHGEuibuxs21W4DULIhA61NWkJOA
         nBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060339; x=1773665139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meRktTehSj6qBj9CkXJ7Dg5Ap2sMKM0JeMCDAVB3Dsk=;
        b=bUnFQIiSD0Jw/duJAjx4d+cbo2fmBSIUwySJGP1keb+OZyKW1jsMi0LruXuZ72sRE/
         bF26aSHR1A+aChXLg6hPe1bmRB4QwxTNrq/yrS0dLkNH3HFYpOToyfH7v5eeCBXSCQjV
         4CuGCCFj/ir01aRquAfIAZvDaRXcRBLkNujUL8YFGZwGR4lv5o6IUJ2EsJZFKgjA30Vi
         gaeNnXkmBW72AKmpTr6d8ipG1u/8RKDTe0ki6KNPMSFlgHVCuGF0ZXxQPNHrqpUPKJJk
         JNeRrKiLfkIeUgbYUvRDBKamuTdOLv838cmo4vCRZh5ANXpkLTru//kv2MAVrt2AmsNG
         t1bg==
X-Gm-Message-State: AOJu0YzmQCyXSzcFk2wHAHF07b5KPe3NGRv8oet3REVMu7KxzG64AXm1
	4Y+j12RuLbhGYlAYSEYJuR2qq++hkN4IpLqDepVsNoaov78h+xool8cCmwBPk04uJeD4FT9bMIp
	e/z7kP5sPHQatBHCkj9jeE9vpgWRARsYzmmsiEDEwkeC/pE5672SYxSlVCP/y5gXvvocY
X-Gm-Gg: ATEYQzw4U3e1O+Q9h5qPIl04ahPd/wYdqXf5ojwPFWPWDSGpc/4OsQNem4sVxdMesTs
	/WsTbtafXt7XKkYVIRU+VmwuHKN6auaoAT8wW/Uu8TCvmrOKUMgLbU3DHTDukyNDcukmPHCN9gd
	4S/qJv/VpqtSby8q+XSb/4AROsBCZKc7IKtEFEr/ZtcMDjPiAksFE9SsDT2GWINAZobFi5fDgVU
	iOGDP3eOTJ2rHxE45Yw0eAlHCNcvqJzBb30rgbVBfqtki9d/5gbOSpDZzUU8tTxgGKaKEwD/B2H
	Ri0cqIr1jzmCulWxUwroFm966pyRrC9JcER+8KlImha5+NY+r9CeKryIlcZPLBf6lqFnWkeOsxe
	wYJd+TL6VwS9cz1JyG8SMGC7twRaRqsbBeYFnLXmx/tTetE07L2Ui5aYNIxWKN9VUIPgr3Dpve2
	+tIXE=
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr364079285a.7.1773060338695;
        Mon, 09 Mar 2026 05:45:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1914:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cd87512f16mr364075585a.7.1773060338133;
        Mon, 09 Mar 2026 05:45:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm356164166b.21.2026.03.09.05.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:45:36 -0700 (PDT)
Message-ID: <f1e77005-8af0-4628-87ea-b38263418bdf@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] drm/msm/dp: Drop the HPD state machine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69aec0f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=9ZUI4OZNt3IswVLbaQEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX5ZraMZ/risVb
 D/YE6iznWtiFxHO8eyIgaBdDtUKm13E4RbsqUpXN6juMkUV5h2gEd93LgLAjX97R5ZOT7XfE6Cc
 JzhF5foeGAW3/8/FBKW2M3zrLFkGLsg4mmfLgNhVN2Q3fSGSxCebOY9g8BSgLSksJxrnW/Zq7U3
 EG+QdSHj4/CoOQIJi6CFFEnnEnuYFoXo6kL3okBKJxGaMERDyQj3lqoyHVpvN+oTd48QyhHcVi/
 7030EfxboUogVSsmos9kGItMR/XuAcAMDS9TEOeBCb0iW532uVgUID1YAWKe47eP7jJ+s8eEq0x
 hvsRm9fZDfO2Od+tyucL5uDXx1adloxBVzFnUptUyVleMgv9oymWFgDkb72NWyJZQCVC6CXR6hQ
 /icC2dz0Hp99icEQQXyJP8VvJvGgLULL2pIbi76AEOjG+J7YcsqQ4aixlSARZbsjPqZKwo6PoNl
 IbUUBu8XHTFeAkVXlxQ==
X-Proofpoint-ORIG-GUID: Wk9FEW2NvHDSJ_qprppyBZOjXOh0R9pA
X-Proofpoint-GUID: Wk9FEW2NvHDSJ_qprppyBZOjXOh0R9pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-Rspamd-Queue-Id: BE36923928A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96262-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,patchwork.freedesktop.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> Currently, all HPD interrupt handling must go through the HPD state
> machine.
> 
> This has caused many issues where the DRM framework assumes that DP is
> in one state while the state machine is stuck in another state.
> 
> As discussed here [1], this series:
> 
> - Removes the state machine
> - Moves link training to atomic_enable()
> - Changes the detect() behavior to return true if a display is physically
>   plugged in (as opposed to if the DP link is ready).
> - Remove event queue and move internal HPD handling to hpd_notify()
> 
> Note: eDP is mostly untested. This will be sorted out before the next
> iteration, but it will not affect the series in a major way.
> 
> Note 2: there is an issue with the DP connectors using GPIO for HPD
> (rather than using the nativate DP HPD pin), the DP will not detect a
> display if it is plugged in before the board is booted. This is not an
> issue of this series and it will be handled by a separate series to be
> posted today or tomorrow.
> 
> [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> 
> ---
> Changes in v4:
> - Fixed PM runtime handling
> - Fixed several cases where the HPD machine would loose its state
> - Fixed the case where detection was ignoring the plugging in display.

- forgot to run b4 trailers -u

(no worries though)

Konrad

