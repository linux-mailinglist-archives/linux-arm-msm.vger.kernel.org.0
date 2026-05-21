Return-Path: <linux-arm-msm+bounces-109008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BV8LizZDmq9CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:06:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0235A2EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0022A307315D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D4437DE87;
	Thu, 21 May 2026 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpW9Wpzz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y15pe08M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C992737FF42
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357498; cv=none; b=NQzx9vhoB17z5T3ApsogLaIxlhJck8t4/qRIgnNdxpMmRZjdr0Wse7Lp05Q26x4gsbU1nEE4mq/vi7hmQ5eMj9lxZ7qsciOTZacJFpGQYmYsf6WYyGblA2UcT0VELz34wBcroBMuZcRV/IxJcNPwPHlJhy0v0JGEdjxzKjSsiM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357498; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+E2LrtQ9XyQ4iSwmFAt7liQbLkF8/sYdL5QhRXtAZXoj89pk5Q4feigqp4WtuKNhdyxcCUSQCOObHMqO1QcSIaaiAHYzV5ZUfpBlDyAzBM2on3fJj4UuLEJPShRuqbYSrVjSJvCs03uGFRtSKfb8CrEAX+cguzdCKGMSZkRjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpW9Wpzz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y15pe08M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99wGA2491870
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=kpW9Wpzz90SqZ4WM
	hJqiDoUJvuIznDANuE893vOdUR29VnKWHPA3tCDdyoZLntSdQ3oUDIbTaAn8RLBU
	PYHrLbPM51jUL1a4LKoM4O9cUpnuCWv0FnMW9WiHlC+CJLzED2GhRv2uP2mfbBqm
	IkGWVVUd0jJ097850KdNNJtP+K5n9I3iOTKjMaRddLFYv/c1kyuKD6DmFKwjUhBL
	s5YVhgq+tKxrmn2OjuMCbD32bHGHIpppD4Cg3IDfu5vJODIpVFhyNZYdy2cHAvRj
	gGSx5H84cmGFtggWpif50tYtl2aYTgzoAIIDJrxleGPvXM0WblTOEbKD1L5sytTc
	W/NgRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4cgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9f1bccd7so15317441cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357495; x=1779962295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=Y15pe08Mej0Klcw9EDZJGrBGsZ04KoHf79WtQefQ0JRAI4zgMnN1U505eCg1lmt41b
         ohy4HpiJdt0+U7b1/9T374aNCaXLjqeA4Pqm1LqqZfKBT0+d1JjQG2XHm94Xxsh0JbC2
         ByLaozgQBUvVdzjRzMrt9jKG9/zTxO7wykalsc0bcz1F16iDM1dbH9AteT9FuU/N3cRO
         PwTnZ415kZb8fGRc7wsnObNhBVutRm+fzm+x0nEhX5vClv03LzDdu5E9NyA0p8gdaibx
         IzeXXP3h2kcf5MxZPHLUHmxLcAKwp1pG8EOkL5f6EtS9lvgQUur8UBGwJb8R9XD61uFk
         zquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357495; x=1779962295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=Gl/D+MvkeDohcQ9Usxl40V8mZiq+L3nvu6Fz0AHex/W9VwknojzkymEfdU6+YCkrcj
         19Qx81W8AzpIiEtgJ4zVASOM2ZAz4PtRuQPQrGat7K7vaYnUvy19ru4IDDNVn0eAarpT
         TeQNcF+nrTOe28apibJ9ZveSIyHIeyD/zYv/1Tfsa87Rhustc5rlcUp39FaibEhluwbk
         87/kvzMJuy4oImebzne5RByTY4rdh4kkzZXwYNACgssWj2zCQL4bZjIEjqVAyrHS8DKi
         ViXg9KffMwAO3EgqzPLhIKH1I1iUzFwLPHCRheSZteJNL5lerjqINi6D2pbLopx/0j20
         jbPQ==
X-Gm-Message-State: AOJu0Ywlt3OhMX1T1QhgijyU8uyYu3+Cf0MH0km4FefRui7I2hvzkcZl
	TYBt+t/8P09eLZ9Mra5d61vLe1GykUpV1DbOTv+3eoPdCqfR/W3wh3P2zA7/je4e1NDvbGiJCOT
	pkVEfTIltjAM5WFmQJtmZf805OhANMuQu3wauMXTarglA+MQVvO0B6zMCzHBnM6sivCaN
X-Gm-Gg: Acq92OFAOEELKTcNeMuugimhVJ31Lnv6VIsEfpWUP7DZBGzRwulC0Zb9xjV0WbEP0Og
	hUsk54fKZSj8skNP2BIkoBdM4JoZ8z4PpBYf+87p2YCMwUmUcoMEG7owhgeeFtwNWZcDjq/UkGp
	SBjQaNgSLoHlxGpNg41wbqZLAPmg4UI21POvQDLxnNUADWgHrb7UI3kmf4htH3z0Sn6C3mFreb5
	Tlc62W5qBjlznGTAOpSA+eVT8P0gP9PvUqqSoPEc/p6kyjgDm0KGAh2YQp0HQdm3Er11HPVkEQ5
	8LhlaE0ezqI5OG3EPrm14iMYupBb3XODACf9qHDJqTkU+CbGhKML0rjUppJbYYAKToMbceKJ+zr
	nClC7N4HfBzUtY49T+sIi1tuOvEvSlagPdJnuzM6vgkPdsdq+yACeLxkzmx5wKA1TJfN43+zrl4
	LCmus=
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr4674461cf.0.1779357494942;
        Thu, 21 May 2026 02:58:14 -0700 (PDT)
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr4674271cf.0.1779357494466;
        Thu, 21 May 2026 02:58:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e79df9sm24655866b.17.2026.05.21.02.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:13 -0700 (PDT)
Message-ID: <d92c5d0c-65f4-4efe-82ba-96507537afeb@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6350: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-2-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-2-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ed737 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xdD6WR9NSQmJ6z0w19bJzpU4WOPodYxx
X-Proofpoint-ORIG-GUID: xdD6WR9NSQmJ6z0w19bJzpU4WOPodYxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX5CynAIoNctfX
 IFhamjqEI6Zby03KbU4hwzwnff56z2iV0cHRkcELYPHLBPo8N/BuxpXymHN72nPsz7BD4AA432e
 Usf1tWvrRJ26OE24o7ASODF0YVjF/aFWYE4VhxhLc/qwXyzrfqyX4DSet8hbut8jQfnNBqK+Otb
 H4v25MVE3EhSrupYsoJPXlcULTGN5eb5eIZb5+T9QbnK1j3JFDsPXl4jdkZ8zxpd3QvJdArdFXM
 BGjDXKmo+326iioCkFmvVCbBVu/4x6eunyjr5T7xYdorMrowWMEbMfUo0sk9K8VlVZKTuWJlHun
 6jFZje+gL/zQECYqUiat10yOI9BDRXkLqtagIK8bStCO4RGB9Fc8clHYy71/7M7Gn/yLRABklAk
 pKArUtB/fBRt+J57UH0TNu3pP0yXuRCgOAl/Roqie9k+xUSkxqqIatl/C5/3DgeIsLRPsf/HlrG
 taAze35CIHHi4JuiQ5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109008-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C0235A2EF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

