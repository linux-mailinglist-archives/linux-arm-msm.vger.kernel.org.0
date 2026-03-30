Return-Path: <linux-arm-msm+bounces-100673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEtcEKYdymna5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:52:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A795635617F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AB5D3009F38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB5C39A7F0;
	Mon, 30 Mar 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+l1yveQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zq/Ue1Uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA138551A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853539; cv=none; b=YAQoIqzxwdaq4EcGIizdQ+OKZIXzGfRQShvSdevsMWgLt4bdoadI4QrQfzyqw39RllwesaSOHoqcuUB7a3JxBN9BCcowFWDnNtORuhy9jfIE8LwK/zPpbXOMAiAxrgXFsQkhykeIStqtresSgnQLhEy4R8dHbuRVHVQHeHUF+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853539; c=relaxed/simple;
	bh=EmDj421TyHr/sfirfrzl5JYdDAMG9Vp7WLhUIhB1Oqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP/QzTyrbSL9CBpB3jPnwWgRx2l85WiP9DwphM/OqfI4rm+SeDSejiEuzLudyaQfOcVnGWMziSxo7x1dXdl4CU0utHyAq1EA3mLDPosd9B4oXmZeDeN1E3yZZKlncB2dwT/RAxCPwOS43YTdB0Lj+r+w0NAB5JFXuDms0mawFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+l1yveQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zq/Ue1Uk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TKo2kg2849068
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=; b=Q+l1yveQ93C0HSow
	mlgwFFcOOuoc89YBzv798i7FKO0FnPPH9UCQ6tqpDgjyxfXHo8jp/kG4vjkdcTSW
	cxE+iH/2RD9JMiODGDtsL0/S3B7mYUVJ3Lc6w+WgW6CvYgRw/M/UunMYPY0T1mtz
	SQlwX+X6dofzWJxhtCkZ99UbwQ2Wpyq6FiDOdTvFy8xUSsRGAd06kTADwU7uR574
	g5E2XjLm5nEmRSNsdm6PRmixfYQu1qxDrpyFCiM9sSu+SJ4xFvmO7/4UhcjEkK1/
	uFpD1eZjTdOzhmtj8PxxAkgX7w7KBtEktg4Lb4JupgOWRvuV8bGDmPEs0DdbXqc2
	UitxKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672ucv63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:52:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so2762894a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774853536; x=1775458336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=;
        b=Zq/Ue1Uky8YYkVUgeYqRycdiYPLS0pEl5+bKR08AvbHv2oqHwCJ5vwiHl6AkmmlxIS
         4ylCrutmNnP4w7zBoguWE6WiSEeO6v2fGJNsbD27iyD+h7W5SeVH8+2EONx1yDUeU6mw
         N7ST4VfvkRyY0ys9rfTDNol1yk3vMCR5QHLgVUOjrnwYzkwNoGX/83XjLdouqzY8K5MN
         OswUTvsJeXfQea/F161972WPZxYEZRfJm8mHqaa4YaA/C5v20uwa67bdt5E0Nhr2O+O/
         ULyyY9Spg/CTBqKpYmqIEI3G9/5AgyW/SVzXjDxsRRI+u4Tkqb5Mif0kBrfgO+15sN6j
         vV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853536; x=1775458336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69P+91lyrDDQ/DKIeOYy+Twbri3cK6MdMeGzg9mFaNE=;
        b=Asajapf3+yj7a5L2Pv4w8OIHKq/fe60OgmWMpI1tu+D1IKS4yqVMziAAxMDMX8u+h6
         QlMGnJVxfs+Kb9FUsJPpphfIbCwpqP7OmgySOWPDBl0ruTRDal5OLFFLyxbdn2Z99mF6
         2nYcwVBnhSAX2OfIDpNK1pRU88iX4Z5uuUXgrsTViW56sh24ttkD1t3BOzWBfHduTMeY
         g1QpqYMKMnvMIf7tg+2DoXvNTu44z934n/3ADIjrD5r7WLPee43kS6e3phd3LNbTABCp
         r1m3nZx1YxNNeT25MtNqDPijSjXlJt55JvsQXHgkR5iq8yEA7q0fP90H/sqWH+RAVf8o
         xO9Q==
X-Gm-Message-State: AOJu0YzHPf4kjPNoEh/ROms8NWI5ehUPC87chitvRkWkvr78zO1GF/HQ
	YUIlaSqEx37NEXWJvnJSKqDa1AZkDV/NSbQIItRufXOqX7Uhtj4Wqwny+xx2us1v1uNc8LgsPt5
	flKLx2xKIc3kwqx5B3ixpZNvVHE4fO+pFc6i4TacyMhzm8blA04mr9IjIqXBuS6W3WftR
X-Gm-Gg: ATEYQzyJRdqrfNjGtZf8vQ9RUnkGxLTfkPwn4s0aLcl0HcZv0NJhyYyQXHGfMkJSfaJ
	ujPD9Fduuci1lmVdhn5dGdGut7MMgXaTChXrk3lx5KOUDcogw19F9/q0Bh8rG6SL9Q9075ZL8W5
	yWA/gQ6EmifCebfIJP7tukkztCGH8EsEaJTief/JtdktHW9NEY+S4hs43AW3lNyrSjgYuwjutkU
	FHInfts6Rak+cf7ZrKyIc4Ep6An186buMXZ0tksYwHcW8PhxBbJ0dOQZV2QYCpQMkF7OyWM2yrD
	9v4nQKx7oIzt5FndwgRS5iXBDYLh5OXcczxTmjcFuQnx6yZ+d3XbRljBXPlQ8GdkwuSHe6lG+8j
	Qz4skyda5YwmnazAoltMrDwPmgkNbwfZ77CUqUCcFyer3loT3rZH9D4c/ZMDljIZy0+zkkZH65r
	EXa+vAomEuamlgKET+lj1kOjk1emp/cuTLqw==
X-Received: by 2002:a05:6a20:e293:b0:39b:87f0:758e with SMTP id adf61e73a8af0-39c87779bf9mr11974520637.8.1774853536443;
        Sun, 29 Mar 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39b:87f0:758e with SMTP id adf61e73a8af0-39c87779bf9mr11974472637.8.1774853535822;
        Sun, 29 Mar 2026 23:52:15 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916ba75esm5324404a12.6.2026.03.29.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:52:15 -0700 (PDT)
Message-ID: <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:22:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y8n-9V3FLAqdQ0WKvcvspkQe1c_oacxL
X-Proofpoint-ORIG-GUID: y8n-9V3FLAqdQ0WKvcvspkQe1c_oacxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA1MiBTYWx0ZWRfX30XsTVWWivCJ
 aq+WYj8VMN0AEtUR6YxNUb1ekyabZByfUR328caBOpVtBLp3KMLjVyt6DEhcqEbS/93GBxgDe+f
 Xw+P+YKopw1FeGhemdmu2syaUxD1AIPM8SsAF1earBeu0XBCmP86/KAOd0BrZWtaGl8KRKxXHBy
 hlCdiwS3BvxAtU28oHSEJphy/dU41qTmzuiBYCwNl+d+GhouY15Z1ZY9Czq5umIjs5Rk1asw0iJ
 1zuMrGJHovj2cLUMYnWEgMYQJohJeaYtVLAlOMxVK7CZw3UMoMTIVWNlPy+5cVYN4oB5OuwvtwJ
 FzB0LuiP0awvGCZclaX+QN7Jhlzpo8pzQ9lzMLTpCCIYF94OqsXp9/f2TfnSA1F3vcqQ+XrUnFf
 y+SQnAG2IcT3LepS7T05TKfgI89gy8frFomC5DcrU53825Ih5lV4E7bogxy5sa/T7QNnSERkMXn
 hb7qYJjiLbiimzj1tbQ==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69ca1da1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yVnEH6U5_fyVt_M49LYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300052
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,infradead.org];
	TAGGED_FROM(0.00)[bounces-100673-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A795635617F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
>> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the EC.
> 
> Just a question, is it possible to force fan to run at full speed
> constantly? That would be helpful to keep the passive cooling minimal
> and get a more consistent results while doing performance profiling.
> 
> I see that you are registering a cooling device in this series. So I
> suppose we just need to update the cooling sysfs nodes.
> 
> -Akhil
>

Hi Akhil,

Yes, that is possible. The cooling device registered by this driver
exposes the standard thermal sysfs interface. You can force the fan
to full speed by writing the maximum cooling state directly:

  # Find the max state
  cat /sys/class/thermal/cooling_deviceX/max_state

  # Set to max state (force full speed)
  echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state

Where X is the index of the cooling device corresponding to the EC fan.

-- 
Best Regards,
Anvesh


