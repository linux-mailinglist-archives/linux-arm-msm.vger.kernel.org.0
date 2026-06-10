Return-Path: <linux-arm-msm+bounces-112463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r2DGM5hgKWrnVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:03:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F36698CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jo+LDpdc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j6B6an7z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112463-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112463-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB1AF3309696
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FF137DADD;
	Wed, 10 Jun 2026 12:57:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E67617B418
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096254; cv=pass; b=AmC6MDchOTASyOrk1DIgF2VtF+3ybEHo49z4wcMqlqDnk0t3U3s9jcnuDSjfeab0d9OSx1Ui0nTIzOabva32etpCnfZuP2qzIZhlF5yOVXLuCrVjm1og3ufOcbhseD0UzVbMQv9c//8F4pVyAxKq1hnS3H1FoIwOTLGwQ3/rQ2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096254; c=relaxed/simple;
	bh=tW2ug2qnrfWrWds0MaNm+T/zDf6l/TTye/3QEm2z5Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi/fM2WHsJUYSoWowPrSKRS6n2ZwGGkuXCqpHm5skmGn1DJEQZwGQAXbeetQ6E44ssQA09DDGXenYY/VVOCUDC42DhD9OeyQUxJYSCpr507Xj7htuw+djgPwmOCXWMHnho9m0mkKE3MVgsfezZrxLu2O9k2vD2kATUPMd2mDjLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jo+LDpdc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6B6an7z; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCGoj1607877
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=; b=Jo+LDpdc3hbtLP/N
	gjYv5nScv03nwS8ZuhcNwMT0zY+aZET5SzRVpQL7l7MoqMhMHenG9ieXKZv4hxon
	Qilk4FFoBMe0lEXgJ1qjJUC5jT9xGEE4PQ32yrnYcUYNIiwV9lMGnmSUV8wqBU9K
	CAfeRvmMHHP9umg9HGQjplO6wRoo3pJJ9BfCepz6OjMgKlBiYzDQ04de3OMcHsjV
	3He/wi4n1vGNl3RwHVjeWo5OjIW0zw5vIp2ytTr9DpuUXkEDDPoTlTsamCRlro8v
	MXQxj8xffuheHPN1Wmmtu3V4JToSbfz2PnMlmQQ5t/WLIqtO7vvJIbIYUhYWS6vt
	tmYDSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9uu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b3587972so590431985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781096252; cv=none;
        d=google.com; s=arc-20240605;
        b=HOE4Uiau2SO2VOrsXYOXOwqVixaV9BH68LU48RU37F9YM80jQi6OCZi3huDLDCrC2H
         oMr6hC0fJYIYHiaO5uPm6CnM9docSCgsfiedI/GiMS2OxchodTDENJpDUAGZb+W3kDmd
         bTZCmfO1GbsbkenkdrTiAvn3ZjfCJzYRwSBhjSc88s0RT522lPYb5WdxzPQXn/m6GZ9k
         o1W3Wz6iVWLuAidieWdhuKFSv27Auw4BDOpBV6OrA1tl9OvyQSSOuUy2M8BNIzh7Yx9G
         ba4AvKtmj5gPjUfHHtiETGtMMkBarT+ES5AwzYWpbqjYXfth7f79vmcBygmP+t6scusl
         thiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=;
        fh=GQpuZotSdlBQQ06VSBQ1Ct63UlDvGvihk4u5ooncvIk=;
        b=k9mOkrVThSk80me1vUwVZVMQU+Pa3qmNkZicuU2uNeFzUXwdwoLSUj4dyy8hZvSacV
         b/KzVTgPXLxtsTX1v5LN/eY19NhOq55fUAJ7WUZ1d6EoL4osCU/xzEIuMWKMOyjwp0Zd
         iQnFdcwHyt6e/sZlx/MqmKiuQ/PXwpiiu0TafJkDVUcjrQf7LvpHxJbbq+2Fv2MkEjoo
         DVGaX/KIcOCO/poUqH/YUCVbVipbKVKSqEdtIBZzd1vyTT6C6J/LooZuo3FNeZagmyXy
         eVCk09dCHgC0XUmp/NqtkQscW07N9HV9r5fdoHtl3D2zPHhtysbViaSb/NIBM+yvSUUi
         B2SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096252; x=1781701052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=;
        b=j6B6an7zqZxGg014HhzqaQooIcLlkiXrrDn6S6CS+NqPkKWenhyOv6GBZyheRsNOv3
         FaTq2JNJ+Sv8g/lNGN87hmiDyqWh/lJe6LQqcOKr8rjDgQ91trV07LronCT8ablS6sHd
         t0YXPtbLaFjUQnKgGz4ZGvQ8wTllIaHPXKCFbe7KeK02WaMzQyhSLzV51trsGnWLUsKd
         FfIVCGYHFoYQFAw35MhTemJlHvsk/ol7O4/Sc0GtVxizKQewJ23jMlRZtGS8Avg23aie
         g7qPstBKYUpZHrDrtxJexABBCYyOEOIfd/zHg5oPIVVjTHpBqRyI3u6vwbZs0yWLICXP
         YSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096252; x=1781701052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPnQHsDQxAFQsUL6YrmiTafLraETCc7/vVsMuuV/bhU=;
        b=sScfYYFjBUrebzDC2aPixifqxwjIjV4FWL1fWcxulDgoraE57KN9Yl7qOhMSp8n+hh
         orVsaNz+GTFdcie7ipANdN1DEBm+Th8AzrO5TAOpUNCTvAV0eLrvXFurzq4hNv46PgeK
         cfPqto2UwYe7o3KPmPSwJzxx8JQ+l9oQqFbEFSnpjo2280pHHoi+xqWLqn3uTD6AnH6G
         6bXjDgOS5ew1YfSvxr/jJZTDMEFOI7xbp+tGtPyVe3MLwa0u067tcUSm+T+rnsdRPQ6M
         gzEQek+vW6rLqEV47ftV2yZHS79JkegCbNgygwfGAyLG8T5L2JfGZztXYLHcE5tGsqbt
         1uFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8d8foahUUfexP2BuOkdkS7VDtrV4osm68sdnRabDx7MhPYvAwJYf79RcXGiLfVzNjngU6kom/Nt02eg3Ev@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJYHuszve/Hk3A5zM1/NuZxDxV5ITF37IBgUDaFJvkYicPMam
	gc9u3b6gw4IRzWGU6x9P8tcf2zOqUuayxw1D8RkXQqPPS5M3tp/lNUGD8h+vzycv8UrXZZu3qzo
	neSKrPI0o3R6C2IumjQ++unC1ECD3DM8Ak5tRkUuLwMKKjCQ4XqYvcJ3HN/GaxmLOc54DzJ/e0F
	yBUo/NWG74Cd2ZaaI1WU8Ndo3Yn0ucS4JPROGX3oQ1KLD3wxaw1xA=
X-Gm-Gg: Acq92OELj6qBRV2JYEa7iNdfMbZ9wwsNeCpByMdZTo0mr8h91SKuiufO132l4NpPaCF
	h4lQLbBVulBuSH9BkWP+9eo3RMqSC8SVVVAV+DITqqw37vI04R+ED5E16xI3Wlp0Vg9F8OqLtAl
	FxAWCxEiyjjlW/W4rzkD3qRCs/JcjO4qJrgMf/QV7f7XLfolHPP0VG86YZP9sOzKCT1R2FJGz5H
	Q3EhecYu02Y+7HVqrvnYI1d1X51e1YoJdrlBiMJmHg3W9AwNEu8rmThsVJC5UjSvzhyX3dz/ZWC
	A4SXi6kbJE+tqnYioSBkrOabmgE+YGAqJvWkRRGQ+YmvVodmekjoJgSLtZ/B
X-Received: by 2002:a05:620a:2a05:b0:915:8f08:5fa7 with SMTP id af79cd13be357-915a9db4f9amr3985360485a.52.1781096251528;
        Wed, 10 Jun 2026 05:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:915:8f08:5fa7 with SMTP id
 af79cd13be357-915a9db4f9amr3985355585a.52.1781096251053; Wed, 10 Jun 2026
 05:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:57:19 +0200
X-Gm-Features: AVVi8CcxOKigLr6194Bhv_WTrw4ST8HeTkfkITNz3zuzkSQJ796DFO1Yr47kJiM
Message-ID: <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Liu <xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a295f3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GnT27IE6eeqZaXBg3uAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zWeQYwjpreyLknnb6yhhxsqbDOYQIXbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX8XmwMrPPuFjE
 bADN3lGqiU1mf1RcibMZNIBt19ux8A4Hi3SL92aPv68es38iSI+7rfnEWyDD6SgUWIPSfqdIxX3
 RDVcTpUhZZS8BYfyGkZsvDSHaTdcNruvA5jrKs43d+cgBX4cW7puSO7GXTdKay9Z2fPSd9eBBhq
 inAmJY6CforRtNPUZQUgW+pvSQ03IQpQlYbm2zLhOnG+bGG69chhA+k3UnBgrTmZs8BR8NPxCyL
 qw8cZSVoWWNav/LZsVUApGeofzA28ZGniEv8+hQuFTfS7E35lNZGEThnfJuZyTwJBmQM7CWIm4R
 1MvZpRMVgZ2j9SLxRSgO+tKWlR++yUW9nEcYooOZ50HRtT8mbRQ94TMNgkjk6dxBCD9ba+1hDrE
 wuPkvjsd3A16TkGYXkIpXx3vVsVl1RespTDShyRaL1V7JMVwUsiR88oIzjekBfKZyTbtJLMtYKk
 LMG8NM8XWxm24TaXjpQ==
X-Proofpoint-GUID: zWeQYwjpreyLknnb6yhhxsqbDOYQIXbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112463-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anurag.pateriya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:lpieralisi@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xin.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E02F36698CD

Hi Anurag,

On Fri, May 29, 2026 at 4:29=E2=80=AFPM Anurag Pateriya
<anurag.pateriya@oss.qualcomm.com> wrote:
>
> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> kaanapali based boards.

I would like to highlight that when Linux/EFI is enabled, which is a
common config, efi_reboot is used as the primary reboot path (see
machine_restart). As a result, the PSCI reboot hook is not invoked in
this scenario, assuming Qualcomm firmware provides EFI runtime
services. As a follow-up, it would therefore be beneficial to also
improve the EFI path to support such custom mode(s)...

Regards,
Loic



>
> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboot=
s-v22-0-28a5bde07483@oss.qualcomm.com/
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed subject lines.
> - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-change=
s-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
>
> ---
> Anurag Pateriya (1):
>       arm64: dts: qcom: sm8750: add reboot-mode support
>
> Xin Liu (1):
>       arm64: dts: qcom: kaanapali: add reboot-mode support
>
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
>  6 files changed, 30 insertions(+), 2 deletions(-)
> ---
> base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
> change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
>
> Best regards,
> --
> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>
>

