Return-Path: <linux-arm-msm+bounces-118371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IBjxIbFPUWrTCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:01:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB673DFA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ekx/Ir9K";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RtJLyEIg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68E29301AB93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB803939A4;
	Fri, 10 Jul 2026 20:01:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320C37F01F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 20:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713710; cv=none; b=WuvFWXWcHzxtV0EMIRB0oVEYCieybH1YoXBcrkyTc7DJrJiXwXPBf5d0XsXBwjN7Xon48IhvGLasNFhzIn1C6nRVlcVERz7CMvnvOvs0z4KXvemyg3UNDuLdqiDB3I+oFBo9sda1SBHS0YciXCUBGtP8qEjmmD0bQ1uiqPq4GAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713710; c=relaxed/simple;
	bh=Wpj7biINABXruyl7S8E64d6S+aIPAP+SvchHl1VAxwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBtk71J/eXrplyErhyQnx8Xrue2WlWWEyLk49jg/9t55hqzwixOtN+g1o3qnvprrdWbsGqf5qDXgEtHy/3JaI8wYrw1eQzmdly+tr/whfQX21qC/vcHstfXaStn3m9wXd0Q1SCCmUHfYIbbwS3AeCNn0QByGiDjqj+CXZ7Y0tP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekx/Ir9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtJLyEIg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3iPx1361434
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=; b=ekx/Ir9KisQqT+sO
	S+dKYkRjkjB89OmCaMF97bUAQTE4ze415+U13BgRp71chl9J8OEjUDfECg6839Yc
	nrHU8OXQkaA3HRIHSAsV8zu4b9FSDGXSVoYE3+JqrgU63WAXQo7Y+LXc0Qn2dbNZ
	212MK8O2wSik+3XE3fyIz8kqOILZi9bFNmrGti4fH90kNAuOWbthXc1f5nzxXi3Z
	i3SUAjXVjvtmqxsJsvxaQjH7BE46ROkkYC942Ci3GUBi7ZxKgprf/NNh+C4N9Moi
	KcwsOwgJ4eWEKmHL0/2w+8WpmOwVO7wPVFc8npsdtlae8mdoAPVb52lzhb7gw2wn
	ZmWaaw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc97wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 20:01:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso17412735ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783713702; x=1784318502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=RtJLyEIgqnNad7be2CYn6VXWOjk31k/W+zXl/1132uS53TFuElau2+U6ngDlo4KaZ8
         uBN4fCmesPQuIVvtrS+WM8jO2dwESugErk01lemvx/YGw6h8/5NMFMlCMArVCnU7vl/X
         SNtyIVMKi0aILFHbu/HJxHOzAKQhHpPf/4ae75o+ftIPvT0ivva9q3D3O4N8kWTczWoP
         SPfLBDMyKp82zDYtRrcBgFuAWfLcI5ZwIVXTaIBSlGcghnBL5UJzynavxmKwq2sn1ZPQ
         XBX+ksYWuEgB62UteUjZNDrMGuVFstdETycwYrN8AHRdtjzHyhDxjHizobuqcVNw8tJ/
         Cpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713702; x=1784318502;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=fh2sXgUPI26uooZmXx/cuMV/SWKDJ21zMkzVnyXM1Xi5aWE4qrn1PczB8cooTXjs9W
         atVXJS+AVK9LfMP7QfyGqIwfZAK1/hsdxcUyAOev0j84B0nSTZiXDIq2rIdSpRrAubh4
         b7Q68wQcF8Drlk8LgtHq5W3gIBZyUYar8ow8+u4qKTm2eMI4/jcVnnJtHj304LC1skda
         h4eNeUwundKWOW4E/dyPcY6T76SE86WIg/Cx/TrH3ejE9AkvP+8NWgzo0Lx4sggtd3Dx
         bvaSimLdoBIsrWg2IuYVqwTmr/0soJGxRQDOox6dvj6FKOp0/vqEP16XbYESERrxYYk+
         aUhA==
X-Gm-Message-State: AOJu0YxxyMywjCVtZh3928EY/5HgE8OC2v6QJhBFbtBElToszsMpNvAt
	K/XJzaTmm6xt2wbBb3UPnmMgHH+DsrfdBxddDSR0uhFWaLhU8Mpt6Pm2UtJv6lf0HVYvCFND6OM
	iEKOYvsR34PAi0dtU48C95rTOci+TsaKZU4fQtdMxMq++Hpv5p2XpWqccAvaes1D6IYVH
X-Gm-Gg: AfdE7cn3HTtRv6xXdcMkp0ARal4Z7QiBUL0ZOYY6z2N8+ThofEjw4+0vvRURUezpsMt
	TNjoKrikaPCQyKt1APgDoztvg+7nRcRBC0BFmoxqCxKB3okBBqRdaf0UEhD/5oM0hND2rck1MR+
	uVM94AaR+BrmTkPr7lHSm6sVNAZ2hmHUSIkOMRjNmO9X/yzUzlgyqhgNLakxDpbB3BzonMp6Kt3
	Gi/YbIdXFBu02BbuMAT1P+w4bpR88Xg/bxa2Sp6/3kAsIZqlACwvkCz9ne0KW6tI/4QkoXMLNpt
	CNN9A4Wj5Dxw+gykDXuptK82Cb9Cdos5zTQCyu36yxUztECkdAPdPx3rBwCVdHyRZ/aGAT3c6NL
	v+f6Z8tVViihvF9U6qxAXkI0tPmg8ROY4Sj1P7MNAbMo5j8uflBGF3w3WIqfWrSpVm7xm
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439263637.52.1783713702127;
        Fri, 10 Jul 2026 13:01:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439205637.52.1783713701649;
        Fri, 10 Jul 2026 13:01:41 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm50819545c88.7.2026.07.10.13.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 13:01:40 -0700 (PDT)
Message-ID: <3f399cac-d82d-4d52-8a52-45cd9a0e31d8@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:01:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service
 support
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX+r377eccvOvE
 AjfIjjrdn71LNdpw5sWNsly+TIRMY7YnXP/pbWv0JQ7QDTzaFSpeLkK1H70auGIkzCyMS/Oxshi
 khcshbFFNGtZb8cYuGSmqFHH0//H7Gh4GgtFKZs+PybU3d7gfx2kGoYWqQc9btdrNPyqGEyKLxt
 RMFTbgxZObzbCxX3TJB4u0KVo4iPYhir/3nxDqRayjdkqD4+CD+kW8dBKi7TDcSQEnYxo/sGQB0
 fwPU2+huxOH05TvCs/BQrTwdRv3zQwia6nfYV0vXoPE+9TrJEzSocCjzKISRvY8xQGkyFVB0QUQ
 5X72Oa+/qzj0mUCWQwoy19pCVP0dtdgyjFST0dgjFl+s7FAe0Iej221ebPzzhweAOX42Gd6MX2h
 gHyIBTb9Wd+tC3WCzBsQC/wW8Gutb/bR6p0KsZdZMA7zuBzzjmeBJMtLeIaGa0sxv9GtFQ2x0OU
 /5BNEEzitKQwVAbh/sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfXyTz7GIgI/ENM
 roIL8Er5uRCg5NcU3vroUiigSIFlqazpySuEbf7rnrzlj6ek5GkJ5ek3AF+1I+G8DKaSMsR0gIk
 5IDZu1SOAJ13oGN8PnlHMImF/rRenug=
X-Proofpoint-ORIG-GUID: nxwY_c9-XkBbV9sNS9ns2MfzKnRoyFBI
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a514fac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G7o58nB-JDmhE5M--eMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nxwY_c9-XkBbV9sNS9ns2MfzKnRoyFBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	TAGGED_FROM(0.00)[bounces-118371-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm
 .com,m:jorge.ramirez@oss.qualcomm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jenswi@kernel.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23FB673DFA4

On 7/9/2026 12:32 PM, Bjorn Andersson wrote:
> 
> On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Qcom platforms has the legacy of using non-standard SCM calls
>> splintered over the various kernel drivers. These SCM calls aren't
>> compliant with the standard SMC calling conventions which is a
>> prerequisite to enable migration to the FF-A specifications from Arm.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/14] firmware: qcom: Add a generic PAS service
>         commit: 08314e7c2c38b9ae6a5e01c58ed10a950859404d
> [02/14] firmware: qcom_scm: Migrate to generic PAS service
>         commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020
> [03/14] firmware: qcom: Add a PAS TEE service
>         commit: b6f7978da0c4d26fe465aa6634f5a0b48f900de0
> [14/14] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
>         commit: 6701259025d49139131a0eb2257659a066dcca22
> 
> This is available as an immutable branch, for other subsystems to pull at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org

I've merged this branch into ath/ath-next so it is available for ongoing
ath12k support.

/jeff

