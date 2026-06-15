Return-Path: <linux-arm-msm+bounces-113173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pNUbOkHvL2pAJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:25:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8E6862D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:25:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="J0BSe/k9";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Uu7FAu2g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4623830160D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC642354AEB;
	Mon, 15 Jun 2026 12:21:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D6F3E6DC3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:21:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526086; cv=none; b=eRNnOxApTzyxmiVaQtvxNuW7X4sFkJFj7WKaooz+1CD0BxL3VgQ/tcMDj1voHgOgMvdY7d7a1vIu0fnsapuO+CabgbAqlvNm+RPvSGG00gfMvtGlVeRcWjR3JVqMFg9tnOVED2iXHLiqUedOfBjNJrN0WBUFlBeHVYrvpFvRPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526086; c=relaxed/simple;
	bh=UkXBeBmRHKaMvU8fwtcxfFII6WVCWFNz9vLULwhDDRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAC3zMiprzutvGg2oG+0wt+lJ43NpESkaFccG498e8mtCrewVP+hcD03ivw3jZXbxdcK7pKMK7T5YRMFYFXzyKVEuTLsGzf63ytpGd2auE+mt6AHS0cUF5qOcTp1TXcSfn+SOjY5LagrdlvrTVKhEjJ11seLgPIjSalTgGH3M6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J0BSe/k9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uu7FAu2g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApSf0136531
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5zDWzXTpJXcgzc/fWDzV+M6E
	IxAjojxZlGStQ/+t/CE=; b=J0BSe/k9yWfHd6V1R6MPsLRW05p11m8FSd1YW9Yo
	9mFHsHKqLZ5kTWfjC47YKEA3CWDlpDXrQt0LsF/I8DT1ME9A/MglKdXsguFyhn9R
	Smk9g3Mk8FBoB+QLJlGD55XyqinGL90rsC1DwTkIzfx1niuDXrz951aA5ppQ/JhN
	9EdC5QsjNL7hIrqsMUbXy6QPE2XM9Nu7HxGHwdeHdO2eE3DkK9cmHJi0CQhx6p/n
	u9aNJ8WkpDU8UMkEbbSTdWrGqnKQj15whSVnC6iD5JThXUbDWcIJL/WGOW7/qSqR
	qVyd8Upn8f3u3L4rJ/xIJ9VyUfEKKmjATO44o8hssxNTaA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx0kfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:21:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c5794db0eeso3349505137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526084; x=1782130884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zDWzXTpJXcgzc/fWDzV+M6EIxAjojxZlGStQ/+t/CE=;
        b=Uu7FAu2g3N5YkKIZ3IuiJeXCGr0U4ntpvbUliQ/K+qyXv4yMF+P52Xe+DH+qYzskZ9
         NMvGJe7ZVC2sEosDRXKJrqRV3wG+D04+f+M+EG2bLWsSPbfVWJlozCgn/J9JxO3Pu4zp
         nZlZl33drvJ8KIeUQ6ZFDWG1FdPpHvVIyV1Hb5rlEzYnREY3Ss1yWr0Z7Rj3IjQgCSPW
         GRs8GbxgzzxGGucWCYFGOkxPmZJsE4Qu5MV60RQdRrE0b8C292tO+2/NmLq5IkVke6Ym
         TDDbxvy9p1OCOn8vplSeYREMRqADBRpzohxAVevDiFpKEe4rFFvFAD+KZLzmYEDcLF/z
         jLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526084; x=1782130884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zDWzXTpJXcgzc/fWDzV+M6EIxAjojxZlGStQ/+t/CE=;
        b=mx6u9GNl2dIHVht9Obmadwu/oVfWH4crkuER4ib9pVauC+q66bKf7FuONNeQE+E1S1
         dpaJTdL8lDpecNwBdoziNY4DfzLRl8kd+HzAgTSiedD5G2yo0Z6gG04XXqYftu10ekym
         rbLVyp6xDyWLImPk7qLgoI7rNc47cjdm2GZdv+EilTz8yKDXlF/Ayya7/AeE4oH/IUK1
         2zIWPyyP5FJ8REMftidfYnjMSUmi+Ey4BEFnL/n6+FPPhy5RNOhAwQAI8u3vli48ytwN
         Ka3yKH6YAnrsN0lESDmOIa2NUj4AZX49D+eS0Ud+KZOXW/6Si8rj+6D6dho1TdrcWLai
         NDLw==
X-Forwarded-Encrypted: i=1; AFNElJ9u/MUM8tGbggFk9k88KYE2jEK2HRSnPudRTrt2cf2wo+GPzJ66gT15G0I22/rvTCqlfAmuMXWwR6FAdaXN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlj8mAKNd839eu+xrMu4/E1wxPtNBoDeuau6z7OpWEg7P8UjkE
	mK8MyAxY2uL/UFCFjvqP0ksH6qD/sTO/w3bmrPyV1AJ1RiCu2TrDl4En98senloTgyk4KGEkTsJ
	rXDVKJNihulS0MqhBkuZwrartPK6+fA6EATRuuPQxG1krOuBjBRzLCxFqSxOEDfWa0osM
X-Gm-Gg: Acq92OH09Gun9xMFo9QpO1CjMp23TBpLW95lFEzfAJgZikOiNJfATRrm8/YeJcFvGfq
	Kqt1UKZxWbD62CMcswppJ/xL9+PQv9jd7WIB4PbKR6B7OiGvgbwPkVTj5LGY2v1FxTNKH3BJ9bL
	iD9clP51+nS5m30qHT33jKCJbZ1CpvOj7TO6EOS7qQwtHbg9PJf9miL5Lbqp8Z44igiGVrkvLJq
	T6k14WLu7KCk5vHmFRzhe+SNhi1XRIPP8eyFYEGL0t8zPjqbrLT4JFPDSsp8ukmQihgQMtL1YUd
	3BQu+tWKkgXvYzO1/dYu4gyuVWcsF/T07bzoMH82MIziqyxjrA/o1INWUUPawPp2O5F6lnt+PLD
	lN+ZUmcTNCXkLRIR7HOTZpBz7y3D68GyqwjFxBZHZRmUW5KC1DriC+v3+XRQ7/TmrPGpfXTKuvx
	7s6slNziosiDbK3bCI8GNW809yz2ZBSadgXS0=
X-Received: by 2002:a05:6102:3a56:b0:722:826e:1424 with SMTP id ada2fe7eead31-722826e1615mr155044137.24.1781526083896;
        Mon, 15 Jun 2026 05:21:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3a56:b0:722:826e:1424 with SMTP id ada2fe7eead31-722826e1615mr155020137.24.1781526083495;
        Mon, 15 Jun 2026 05:21:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a734csm2725642e87.40.2026.06.15.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:21:22 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:21:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats
Message-ID: <23vph4t2fkwnb7myhogv2tdhzgplw6raiov74hpmthvicos5pk@fgsvu3t3it6p>
References: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: R3MQpPtSERIQpE60sQ2PJPrakS6gm8S7
X-Proofpoint-GUID: R3MQpPtSERIQpE60sQ2PJPrakS6gm8S7
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2fee44 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=F2NTB8sR6sqtLKQ7if8A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMCBTYWx0ZWRfXzaiceuNlVqd0
 ocCxkenShgv5OJbJ7C3ORKHeJ9eEGik6nne5cd2o+uhNH9Z23zYcrN898jMvN4NwXKuuPaH4+h/
 BfkT4fUVdewQqkYGqGep0LCy7gBQeR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMCBTYWx0ZWRfXyT5ucg8qiN1y
 ug5psWlTlfsXAjxCq3m3yJN8DNsWOSiOaI3w4dB1ga9BJcoU/lV4gne8ukAthqqOawGEyvVZ+Uj
 XggzFk2n7GvZG52qQVJzVUz+xZ1ES5DkTrNuO1q/qVVtdeRerYcHULqjNAf5Xotb79dw7fhtvp/
 2jcjoiaot9UOsX0A207o8bVwrXUM2po1EWnsk8xU6exa3Ht8ZoMmNKrwv8D+cU/1sRTJBiQfYgr
 d4AMKm55TDXww412Tu4y1rDUf7G6WP/o0X3mZzrl8h78VcfPBMP9yGisNJP7zf0/tCCEYXpuT5n
 Vzv73tje1124cIru6XIEXqCjcE1y7uJI1zAGqjXUujWASpzm3vUi0q+5hgfZotl6RHfnHlWDN5S
 lK6rbduhOADjJBeFXAbT1DvSmjNotTxNc/6h0bhzgqwJ5UxoVwVBjTUkPAnY9nfB6C4M9XJiI/o
 gAvsVzt4WKqJb9u4IMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113173-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42A8E6862D7

On Mon, Jun 15, 2026 at 02:24:36PM +0530, Sneh Mankad wrote:
> Add SMEM items for SoC Control Processor and Display Co-Processor
> subsystem stats which are present in Hawi SoC.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

