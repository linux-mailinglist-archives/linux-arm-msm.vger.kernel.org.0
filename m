Return-Path: <linux-arm-msm+bounces-112815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7AxSGVwaK2rf2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B54675248
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="e61j/WiX";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bJoU1gVy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112815-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112815-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 090CB32B78DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25EC3B42CA;
	Thu, 11 Jun 2026 20:27:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973FE3A8744
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209665; cv=none; b=uO3jIAGg5TmRXOu68qoZbme00MqLJ4ZvcvUYNT1zYggcS88tbBowW8SEQ6A6HwzhO2enRyn5WhA2RXLDN+tK8ILpT3BDyjQz7F1X3sPlyrY+Dh/4Gg4NlroSV0OG9Bvca498TpnyoVDPzRoF9weO75NWfjJ1PwKeBiJO8XZUfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209665; c=relaxed/simple;
	bh=qk3lT3olDBBLokiRR2lO7JyOH7ODkiiWpCLirs3Cqb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAb/3H8NEp4c9JV3OkKG+UeQQXUeG5oCPb5i5ALfigMH7LofVRsoldErbYPczAkK8xFSbsgKIWlymf6+ve5Fuz/12vQJx3+53ytCa2ZyrlI+M4pzaPGfjNvmZY29Np2vQBFxJgQRqm/803Qp9PZ64nTcp9K974iOvvKdjDO5uTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e61j/WiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJoU1gVy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3HIQ1510397
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wj06zXyDmvIwudcWq/amFKW9
	T7c/rNpW6WT3H/BxWHk=; b=e61j/WiXDqo48wdSrw1+vlefafJpV4HEgMuNyGe/
	BvpGA6tTKsx3aMhAtNXxnoFxQuoy/8f7OZt+cDe0ES1hn95LncnqK9WWY2VPh6Kg
	RUJaxlzaLbYKjMDqZRNYJrak7n+mf5HzEtpjClyUxJlAuGKFN+5lH3eZZ0KkafDn
	cO2Jg60r+VSESbFtBYiQcmD9BVrHMVk1DxDrdsU6jzdtROFtVg2Svfb4opS7JWSr
	OHxKqUD007jJ6ECa3VbV9zRGzg5fV0KL3VXfpD9dw/uwSw7EfT4KEpPTcIMJ3Qnm
	VSkBWVojWYcSb2xvYHBaoydaP1DWiLA4JSJAKRiIUuGTsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u40960-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:27:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so2325511cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209662; x=1781814462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wj06zXyDmvIwudcWq/amFKW9T7c/rNpW6WT3H/BxWHk=;
        b=bJoU1gVyT005qE0RX37zTVC7O/K0BzTZONDyVwwveV2YlXG7JKPDNVN+JvF3ZTz2pc
         Hl4CQVA746VT6sDiqIMwKJZHKQzPXzFJUgw6RCpBTT2VaQBGnTVvU6r7m5dLC8t+RlPn
         wPRDwf4e7JD8AeWvlGBG7XhU35sC6iaqxtvhJ4O+gZsjzy00tf/h3Z9x4Ew4N2u/UxrM
         z+D/ghhtcNBFKie88gEw0Uty95PBmGXZ45toc4QPUOtIhoEjCG2DQ/X1lFOiQS57GdOV
         GWHFD+r6+Avi773Kvdq/uF0ziGDHYLpUW0A8oNMQkwTICM2cB+myEDbrTllozTMxONg1
         eBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209662; x=1781814462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj06zXyDmvIwudcWq/amFKW9T7c/rNpW6WT3H/BxWHk=;
        b=O6FYZVFxAwuyhGh2mgyXvOhiEy0N9Eb8Zd7VHVBBvueVpLYVNqpBh60BsTaFvGM5pf
         ikqJBmDhji2OrwZdc/kBIdGrzSJFIf+xYJg/jOaDBd89SpD6p8am2auYZSvCTIF0IXPR
         Q1BC1pvqKk54Ucmqs/UVxAU8+AnsMR4EydQUekuaXwTjTp2e8908w1Y61fRxMpdV5zqz
         VhIiwl+JZZbayw07NJ4gCQAVx1USCF9mKEgyEVTzZXDzYqD6xa3mMXvmh/NCjLEG2ovl
         /2JSB8KzOFcLZlEw7TqHq/UP3lRjc/PBpSnz0kK6yVvIJfYOPuSee5N7Lug+P/b0QBEl
         EkeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MNS4t2rwxhGsE1lDgIaJv7ud0k9ixF33vXjatv7ne6oDopFxAIF0M2CSMMJwhcqaqXuz+Ra7tqO3553E+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaF2kOLsSgqcYw5fjd7WSl1/8sOLNEP3RFJY4zlDMC1uvULd/3
	V7vGTFN6+G206D00sEo9+K3TxfC9GscFxJLENZmEmXXyL6OAXjzSM8edI+SGbSCvDlkhd6Orgtu
	PFkSrgYe9UrMrCAY8SrV02hZSccvo+V4aydZU8KVeC9KU6aHbZk064E5VseZMcWvH5qsT
X-Gm-Gg: Acq92OEw6E6So9xEM4CFLaj7TRnj8YxwAZPg8cxVY3yRGiBXFV0fJLhyfhwjTpg0Fbb
	8B+9cHtzXa75YaekNcsBqPxiUz3Opqmds97N2m1+wCfyGdDLnAzRiFDM/jRtMMYWgn5tKnvARfi
	d0/aZ/0jInZqoDB/vbLyVzSxv9+HtwQU+NDkI0jm+Iykquf5l5y21LZhGla/ZRDTQ7KUxe3AES8
	RefPcHIM8nDJT/XoND1XuPNIkyG/rcn44vxqTkGrbG/38SniOnNfTyppVBTxI9ZIdbOdlGV/8JX
	psYv5pLaWwbE5b+oHuK/WlqakAIN1wKLutThpugGcdZ1bf1os31yrSOMVLaIcarwMlG7yVLnuKR
	uvK41md9qPWkciOKXC2b2A4Ftxm/5qk9PspwQZiS0r/uRUfyyYBHW6qcYrvlfqd+9zysp90RDBO
	RkYVhs1Zm6qo7NPU8vdWVY8P5ZAIBak3pXsg4=
X-Received: by 2002:a05:622a:28b:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517ede505c5mr69204351cf.24.1781209661844;
        Thu, 11 Jun 2026 13:27:41 -0700 (PDT)
X-Received: by 2002:a05:622a:28b:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517ede505c5mr69203861cf.24.1781209661412;
        Thu, 11 Jun 2026 13:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb3ea19sm126223e87.18.2026.06.11.13.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:27:40 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:27:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Message-ID: <zdb5uxiwny434mkz3jmllgy6iivlspslycjxpiz4otqvwpdpvg@rpofwue2zmbn>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
X-Proofpoint-GUID: MP9R2TIL84YtIz72Puhkbeusd_mmEk21
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfX6vhyWDxd6e6F
 lum949VjOCJxy93d82ASPtT3IJQnbMpzb025u6kOoC22pSVrkxxqiHvybcK9aLijDfzzqOx/MBK
 auOoJja8R9rfs7fIWAG/sNcNKduwQ/4=
X-Proofpoint-ORIG-GUID: MP9R2TIL84YtIz72Puhkbeusd_mmEk21
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b1a3e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WU7lJWFF_htWD4kKYEAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNSBTYWx0ZWRfXzYwxumuuVnxg
 7rMCQU7bN0lLohLHL8hwleVw/6LTGh9XXhdWeuJoQ8T4c4bMrEtJv/iU6ZquyLHDvpFfVCsHVGv
 KKlemqIgiZpnIux0uNqQJhgySLvwlGmfrB03wv4tAiD/o1vTWIzOgznkaDiZGT13oGecrfd6S/s
 fz9UefsfOp/45xhz7hwXdBN5+xg1qtf/W1Y/cgFz3+EX+radnzWZ4r/w0NbqQTsrhuPrIMeDO9e
 9WRdBGVTSFAsfcDyEqEO9rnikOJk4sRiuJsoYkBpkEwhhZ96lQpPhvk0iIhpnOfi1B3H+XQo+JP
 /A/S9Ak4diexID5/Ln8XBmQjfqVO6g0EaXhJhmoyuYIZsU0DTfWDkPN0tJrnMPsk22LEaMdgnSc
 Xq8ElcSZKgKJS3zNZzwgGyPZsC17PJXQWrgx0A2IqB+P6ogtcoM6bzaq8yJ2Ej+WVa/3U24z3BZ
 RSQs+phgDZusq1SE5Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112815-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rpofwue2zmbn:mid,qualcomm.com:dkim,qualcomm.com:email,arduino.cc:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0B54675248

On Thu, Jun 11, 2026 at 04:05:25PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor. It shares the same register
> layout as the INA2xx and uses the INA226 default configuration, but
> differs in its electrical characteristics:
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/hwmon/ina2xx.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

