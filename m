Return-Path: <linux-arm-msm+bounces-94918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGVnBDaIpWmWDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:53:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDF1D9331
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD4C8305B584
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D813A1A5F;
	Mon,  2 Mar 2026 12:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUoRwYfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F88UCiU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7B375AAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455458; cv=none; b=hXulD44nLbyQvk0Pbw1JP+JfHTWJMbD0njMi8lIMHFcVPvboUUmieLvSpRIDgWsZXVAqFOOp9+oNIMzuo8uTv7OvTSJ1+VtRQ4LQ3URyhXFWyZlicU7RQNnyHy8HgU3A+oWbZdvisIBCK/Fn2EYP1WH5fxmdGQNSk0TFSnPcmo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455458; c=relaxed/simple;
	bh=+Kryibod4oEKvoDMEFKdtRQlFED77KNHN7fXMiUa7+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcUwr9UvMiAxd6NVpXA8U2iwdULXk7URE6I63UP1R6gZgQKMJCkCvDTPSyCgV4efHKtasiyeTu8ZxNl9P7ZfqwRjcuyXYantusB9u9cz6Stx6Tuuzcjcul2KI5Id1IE3cAPz4PQs0ioHjss3w8n6LOtTuHYTI81IVp7vfJCvVjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUoRwYfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F88UCiU0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B4Mnr3561536
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=; b=UUoRwYfsG8b904Sf
	8nvtZlsVaFgVvM/hm2ATYKhbDqcTerzW2uA4dMWIiZ8p+vaJKHMoS3LsK6u5RvfH
	SL12qndnqyfBvkt6ZYISKgnxkJs6jCuIWADAYPTO6iH+AvcEkOiW+qjP5OFPcbHB
	PuBHdRP878DXXGCTAMA3Z2cT9OFqrRMVPy1KgXE6xWoL9C3rGAjk/1n/nRcqN1cY
	TpVGSHvO8V/cL1+XohE5gFD0lGfw341BaaP1Ja5pIEBZlk6BBBD5SGNKzDK7Qq8/
	02PUpisINlZ7LsHnnyimdNSbQTkk9nP0NPUGxo8tZcKDPMwiUPPUH8Nwi7kwVGI2
	t/p/Yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv89hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:44:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso389766785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455455; x=1773060255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=;
        b=F88UCiU0cuN9ctaig24rNgNBolVrGN0R49NlAorh5bwp4mV5K58C3VWzioLriR6PrU
         9OCSeMPd9UFlWEMsL8fyQ6xuH7FGYJVzan6ML3h/yiJDvL5C5XieVZRmqMshDvl4Yjei
         ZeQiAxXN2qceR5uRAD9B7wxXbUSYXu+1X1ppZPdmQmmhzQaeNHWvhV3J3jkzNiY59Ueb
         ftUO8s1zetNPy2ZzYeq/p9N5iL8blnXYxkotLnpzu300j8F8ERZfUqvrIFVpWztoqldZ
         Ebt+nhgPlOLhXGpiaWGtb5f+/fddQLx1i4701LuF+dkYKUW4PU5YzEVbC9xNY+utm4Xz
         LxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455455; x=1773060255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pahk4TifdBrvSEGh8Fb3x77ODbPcW0N2RJ5yY1oXuqA=;
        b=WGayG2WDWZIZR+CIDaNSRDE2GE07H7khcbcYDnpC0KMvD8Yb3qFfmvFCFz6VH1T5hF
         QjwnKGadrmaeYyav3td3azqp1YqiPrd6MB1ovT/vKLdetDIllZbNKZfnlr29RZ+/ECLz
         4V1HjJsARVMpRfrmuQXW4vslsQVspBASwrrW/XI9TDLjwXHpnw500379uOBbX2mw4uKU
         Y62Ufhnc4dYtY984AXtq99SILt6gFu2aPZPxvu9+KY7e6dafb3COBLTk9R4dH1yd6Dme
         SGGhlrQfXjS+nivCDNhUeC7OfM3UueEVx3oYy+rtrY9sU5rch0g11Nv3eezJ3Au4n2CP
         WOPw==
X-Gm-Message-State: AOJu0YwV+eOjNtBk+COMAYcQAGiha2dCIYZLSgtbSH7TSGheTdfTt6Ju
	MVZC9DtZCekhDgTws4EFHNBN5/aj1n32dLfDVq+OB0DC5J3+nTpIYoN27wuPOgzdUoF1+pQlrUx
	Dt69xDU9H2kZDvq9jOAUQA8Ivt9mDLaZGVZPZjY+SkGD3iBda0LgwVNrywbd3va+utTex
X-Gm-Gg: ATEYQzwbJFW2ZlPMULb+D+t1QIb7ZQWqEQrZKI+Vci/jqcZSA54EMC91WCxvfKG2jfc
	R4MvgMQSIQ5tzn3MP9xu0md7oZa7pePwV4hEJIy9f3EGHXMLNa7i6yGVuer7+15/J4jResn8jaM
	WLdjOReIiNXdHv11r/H/YRnXOchTb+31wFoeHDM5zvxuC9eScCFgNDPOnEDYOZY7QT8ehGs2rs/
	XiWro3QvGTLjTQecI/wGP9RNbFgn3qmohJeTrw2+nRLp6GSK9PeU6G5/UiPkPIxBEmXxa2A9w7l
	tqe467dC7WKaet1Z7dagal7Cs95sjtb6tXwMfgKxvzPW+fnZGygyY95vpcBrvyOkw7POvmcd+ZN
	E4X2mlHtJdExOKk4XHhhn2HwxHTtMRgdOWsBKiXfgLTMCn3OdwGiz6bkyTRHOChuKpZ85YdnMrB
	yL8YI=
X-Received: by 2002:a05:620a:4607:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cbc8ee61ddmr1276858985a.6.1772455455621;
        Mon, 02 Mar 2026 04:44:15 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cbc8ee61ddmr1276829785a.6.1772455447431;
        Mon, 02 Mar 2026 04:44:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae95114sm470916266b.49.2026.03.02.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:44:06 -0800 (PST)
Message-ID: <e9e4e0b9-fd8e-48ab-8e12-c62e0f6ec17a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:44:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/msm/dpu: drop VBIF index from the struct
 dpu_hw_vbif
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sDDN99tZV7NSGK_582Llv8M47BLiJ70I
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a58620 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=htV9gPYb1xck4idZc-MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sDDN99tZV7NSGK_582Llv8M47BLiJ70I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX9Sn33qA/nNF/
 Uazr2loXjynWxDM6iaqugVYm0lfxzhWwQIZxVTcsouFVaSleb8KntCtKvnYCrOiAUYx/xVKCEDG
 DIhwfrCTeiYZH4vwbH2sV0kJqomOMtC6he+URKFNQMzyy0Qf4n/siZuWwMIsuEzrB9De9xEl3dE
 kazfuDzAULE7w7UGmI7pW3kKG6Vjfk37v6YbvxFOCvZrShACOrxSUkTGBWJGj1rS0bYt7kdClcN
 E18xj9PsHcaygzC/DgDdTMJp4EXZoIH69MTw8w+PwAgUsx+aP24cIBK3NkTuUdybZFUcnS0jiLZ
 fIPC+pkmGwtrZ69dRlNdtmQT+XNS3oJSE+ROqXalH7phY9Jy8/OA4/8P6JZW9vncjdLjx0LGA4j
 gyRJsCTcVAbGiKe8DrwdKlzunu5eda2Z0+DvHnCf+l11N8Yo2CEp/lT8wvC1zJQ1gm1MpF0OTWS
 GgYHT8IPzwMunrDLCPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94918-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FDDF1D9331
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
> possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
> instance structure. As the last users of VBIF_RT and enum dpu_vbif are
> gone, drop them too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

