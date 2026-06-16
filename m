Return-Path: <linux-arm-msm+bounces-113308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sJrsAoeeMGr8VQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:53:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65A68B16C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:53:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lrAdGGlr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O4gntnBR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113308-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113308-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96C263017BD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F5825A640;
	Tue, 16 Jun 2026 00:53:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE7418872A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:53:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571189; cv=none; b=BfeYy+LOVcw0VZsAgSItUTVVrkEk/Glv9iFh+pxv8r1oKMWV+CrPMi8LC+DfR9W7KIngIXPPvcqUZZXQhFac6/bX97SpSAZf1OcZp45Y6eLUZpRCEkMQPAz7IQVudduet+5/Y4FwLqrx5PHUcY0L4Ne6b/zgnmlYNeOSw9LgLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571189; c=relaxed/simple;
	bh=NnIebMcgp+6ImBtusDRxYTiIHFgo3Luuq/SXITrMzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDj4YKc8BoAsVz9o6jMGch4/Q247rlEluCXPPPd1P9sJyo1Yl/s4EylHFDQI61fzft+i1ecC2h18AALF6KS+lDsQAValx7Sw0XwuxXqcQWYNcfoc9dWaBBE7Xk+fFiuZyeqJMx66Zz1RXtBxSxKqGFJNKfo/jNEA8nKje3dXh5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrAdGGlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4gntnBR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OKKS1541598
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJqwxaa5rU7meAmpXVnuWA0t0Wm6+jGN7YbURDLdxZI=; b=lrAdGGlrZRRLEDex
	k0sZXLQMfHuETQmNgwzIk+7ma8Ml0Nvm2WX1ilArVttLWfr/UD0DIqZ0QzVIqu9e
	2EkI98f7/oID+Y39zdbDi6n0/uqXsN89Gbr4iXMCEGdap6exICHYMELDwzHQjYAZ
	lP+eFMIBHV4/uhqZTsdycJTg5QbFZtI1K143RBOZ05Q8GuEcbdXJg9AAmAlDpqcD
	TatIleAma/GFE5z2XExSABy+kgteZSGOUHbBb6VTzfAHP7QpJIr054OIbKAhvwjt
	DKdTnN/GR6taxc0qPb3gABIW2v44h/Cilb5Sr9LZl000P18B6A+z5lrsmvFnBzp4
	SNlTkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter03t7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:53:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso1116846985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571187; x=1782175987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJqwxaa5rU7meAmpXVnuWA0t0Wm6+jGN7YbURDLdxZI=;
        b=O4gntnBRNoMk0+qEUeiM4nCuA+0BKXHC5vEfVHt/EQrPyI7tT+0OYLnvAknzN8pM98
         77GjIxNjnyfiX292YQZSE6BDNJwm7E6x6hz09RWr7dvhGbrboJXO+olt0vCNppfbK1YV
         3GyYHr5vIAdgtAIyFoarN8CrMUFcypDc+q3YxawPzGCtSurLv2GWRsWmbbisgFDXEZOd
         Hl3meERGs1dGmWLcTZrCNkimbKLsUuRxhWGvkQuDbF6K3fQIY2M9bHymASf+D6z1xX3K
         YvUdrGG+6DCuIfCT7x67sT2kZzzyZblue89HLWyZYYHD2STQcpXD93SeVis3qK0t8T9N
         7wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571187; x=1782175987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJqwxaa5rU7meAmpXVnuWA0t0Wm6+jGN7YbURDLdxZI=;
        b=OXLebSiLuDb7C5hePmslVFohukTEmACZz+Ip/vVL/OQrl1lIH3F23cRpVn0c8s7wHq
         wncvzAzuEf7lMDBz3MYW0IyU/XMqm5R9MLTeeeAdX6nPwSW6p1Oe3tkMX5LXMRtMvsdc
         yHHkBLpRfxUuf8RaCJqZJHBxN9GVBKUoPlxRBDplQh/Q2KGGnVP5+7rkBRHJzLXjMfR3
         705/IgYmYU04jdiV/w/toEpVDMA/ngBX8CQKIAZTEaot0rLjqfgnlSK8ll7enZqdBwth
         T0QhZ0m+rr2G9qtOLcYGqWJL/2qQW66qxj/m6om6s9k0xK6/9KFGKnVR4L6o039Qiom7
         4CJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+m8LruytcJ1cg2YStfZ0PO8xSXi2IWm0g5QcTGg1DpDb0aw5qJQ89CFkIs3LHoCeg/JxU5Mrh8gyiMtunu@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXBExRASeKVfBz8ybyUS4SxiVuCKrHymJU6R/muI1ASJlckdY
	Nm7BLsKhA1UCt1XD03pzPmjwUdmPhc2OtBA7z30ziphkZ8JuMZZKblfwoNb6WjA0DL/eHK9btfq
	JXvc9eXB9U4m0HaR90IopsjTAtANO3QJNQxuUUF8+A83lJKSgEOfx+kqC7OlTd2FFXFjR
X-Gm-Gg: Acq92OGJYZQINmVIrZ8anPFx7j+7w1rLFcYKrjesJL1nLMk2xPImgvDn9n4G+l4VzO6
	GbXjioFp4kv9VGO17STEP0FmzBmeeFn2DOQUPvZhSoqG2L8+3rAVF66ukcP0JMHcOL5Bu71tAJC
	cWfvNRVpnMzPMtpoUkVPuOnflO5+uuyZn1alavttqxFddkIl2mAMJe7gZ6M6cL2VzEF1AOpQgnn
	61KD/Hr73R6cMdy0UVUhlSj9BKYcFdUO1i/IoWVc7hY1O89RmzdPUjefdd1Sef0nZ9DlloE/j30
	4XLU5ojbpnbQl5TZZD8+zLYDhtNyFvZFL4lYlAEnOlZfbGLoUV+HGEBp5y9TqntDKuKOIgsfAIF
	Y2wxblXvyABb1PwdmHGSMlqTp6isDANCCFEvKRpFfy+Aa+CUnb9FABKA/Z9sfuIDLeWs0rH6H+G
	Zck3328U6dtAMjLruHjKdkc2nnHKpKepydwZc=
X-Received: by 2002:a05:620a:1b82:b0:915:efa6:d714 with SMTP id af79cd13be357-917f243b141mr2084928485a.52.1781571186587;
        Mon, 15 Jun 2026 17:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1b82:b0:915:efa6:d714 with SMTP id af79cd13be357-917f243b141mr2084926185a.52.1781571186083;
        Mon, 15 Jun 2026 17:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b5031sm3113027e87.79.2026.06.15.17.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:53:03 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:53:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sohil Mehta <sohil.mehta@intel.com>, Raag Jadav <raag.jadav@intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
Message-ID: <wmb446maxntl3gvujkdp7rwr7vsdmcptw7abmp6goolu6g5zum@j2zvqjnowjas>
References: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
X-Proofpoint-ORIG-GUID: is7cqlxoYtTLRD5VJiQISynKscyedVu9
X-Proofpoint-GUID: is7cqlxoYtTLRD5VJiQISynKscyedVu9
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a309e73 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=IpJZQVW2AAAA:8
 a=EUspDBNiAAAA:8 a=Y7cAMVT_gd59W81BrzoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX6KjzgLvLJVOR
 zk/Y4Q7rMd7U5yUWR5Y774SAx5LNDpABTm2+OvJYVuqyE0bJNzT6vFnugl5at43lBHGcRWHi5Vq
 eG0IhwQcEBXULmIuuQ9jUxocLbybZJdPVMUD1DzGKuSInWGCdR6OI1SCI2Lj//Zo6cwCz+hD2Q7
 Y18sQlprgKdzLRL12P2ATjEllQXKfZWO7ZUbH/my5z1Cckj3DABj66vjEjDk1WXCeCzGnqQRGcW
 NcxATJABqnAsdhXwnYw5BeKwoaASzvabdBzl75fLQSgNKCk6d98+W/aWHqzUwZr80bkBdbcHri9
 qVgRaY+H58YdyZnNweAS7kv6RkVNIue/ph5Cisoe1efRdi+qPrawSkrJeQrx1WV03g0x9k/TwFt
 GIVBEc9z5K1JCXBbKWXdYqPOBcrZzZagYvSabvxSxHuqkTOONRFlq3MsseNChajAvNVuomGDyrV
 /oUhH3qA+se7g3a8HNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXz1Feg9IoJbab
 Z5wKPb0d6ajhdqF9SwByLbVm0ricZh/AghYiIcLLzft7OmlXTqUGBQLQFHASwLDfrFRf684UsQw
 E/jRCktwJp2jkIj2SIdSVVYLJmZ5fmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113308-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:o-takashi@sakamocchi.jp,m:dave.hansen@linux.intel.com,m:sohil.mehta@intel.com,m:raag.jadav@intel.com,m:hkallweit1@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,sakamocchi.jp,linux.intel.com,intel.com,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,j2zvqjnowjas:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F65A68B16C

On Mon, Jun 15, 2026 at 12:04:28PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
> 
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
> 
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/soc/qcom/apr.c          | 25 +------------------------
>  include/linux/mod_devicetable.h | 11 -----------
>  include/linux/soc/qcom/apr.h    |  4 ++--
>  3 files changed, 3 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

