Return-Path: <linux-arm-msm+bounces-108970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AQRAzXKDmovCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:02:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 162705A1C42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E8F7309C25B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AB1366060;
	Thu, 21 May 2026 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnMNJEvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnLz/XKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4856B2F362B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353414; cv=none; b=NzwJkNwa1+mJIgv7p18+dp1CylJurv4tbNFUYC6DxunuZmPRq6kAww7bYhhLSep25oXxsI59zxNkxtVxIQRnP6SOsdJsYJPYyQ6obE1hnKoXPIE9ZElw9R4PF4xIKUfoSy5ThoWDGgKguAopqyCsHDg1XmamRv97peN7Uaeqgyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353414; c=relaxed/simple;
	bh=kjnTQfDH5ztmCMBHbUgrzt2rv6DZAPNRGuhf9YoN87c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbxU0ZfUrXgKGFzYPt/I+kSy3YZaYtrdmkS/NwhxeMlSNuKP21w6LQz6tuLRmDdw4c/ULLwJjNWBVu8aH2EnwXNekjsYt/8rSQCGoXPaSwCI9m36x4i/P/ZP/GLt7qRCYyXZw5NkgWZI3k+txGpTbNRNEOyjPh47pHMAjjs0kns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnMNJEvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnLz/XKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6TsMU2157685
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vd9ZmwiYnYNdA0AM4gu3iLlxaPjUKlAA0HQGQTfbg5g=; b=AnMNJEvJYA2RJqgK
	gu7/cUAhMobSm6IfTQYSTfSW8scWkmOt74Yh4YfFOFR7vjCR4jnCIQvfCSU6DKT2
	0vTcsO6cH0rgiEoNzvFOktY2YCWEDgxTNvmRHo5pjwgbexAPYFGJsyvm62H/KYRH
	4d6frdF1vgicruNAq219IALl83vNjuUgTL0vZrhra3O3kXFvIdwK4i6oaarT1GeN
	PkShEION0ZZmY4C+QKpsqik3u+lW0WfmF/s7MNfnzYgc/TdOZzsTq11xP++kmPcl
	oh8DkkzseRMqA4s7sWPZdryexClF7O6teeMQ7nbjH8DUb1KNARBsVVOV2Du4gb5z
	X3GbBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42apv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:50:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90f04f07227so147288985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353412; x=1779958212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vd9ZmwiYnYNdA0AM4gu3iLlxaPjUKlAA0HQGQTfbg5g=;
        b=fnLz/XKc48HaqICO601aS8j/5cqkWEF6Y1D+vG8WvN0XwtHC22Sde2c+jzn2wvq4qS
         5IV6+sRQ0HKUrcr0f24nKJ/618F4jJtUnfEi3Wfymfg4hY3n4SnmRiELHET7A2aMnyYq
         Ze902MtFr8Y4nm4xelurL6HG3qp7zQQWx6nMIqnVUQjIZSwY0TXwTRBRNtQdMPz+VmkV
         Bn3JC5J8ROvHB1gAnOGmoILkO4JFVXc2EpTsNOWDWL5b65R7J6dRr7Efo4ImJpmoXg7h
         ogWSluHMKbg8hsytBqPFDVIKuy2frky3J4FhbR5TLfc7nmEbIytDRX/+0rEAzg8oyKST
         9YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353412; x=1779958212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vd9ZmwiYnYNdA0AM4gu3iLlxaPjUKlAA0HQGQTfbg5g=;
        b=RIf71lrwSMI36PM1quoBeglc9odLHqQ+sKN4MRONjpNkQDFeyAOqYgw6Tc10rVlQzk
         x8zZ0s575W/MQSRvYz0BLJxiseJ6B5IpAXYveiJpbRNcEH5gGY+IxQHdPUGoAbBkanjj
         8vkBe5T12y9MGPhua4M/31s4GELZgLI4cVszWtce2nBAYHHxakh9HPPx3ZOahZc7OQ+2
         6JUDkoma55d6FHstk9VWF25lqF1f+r0JJaOrM0GAtsEE5/2DGbvor0Rx1SibGLlx0vy1
         emngPU0Rx53PIqMGB+KpFX7SzRQASw59oYwhvt7FI0Zqgrz2UwQ3lTwePgrBqhU/eDdf
         o8kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tzNRQJFREaEo8UQEcEW7D+ZHLi9xf3Cs+SWHUdzKlkvzYb7UcJ3Hh6bf79DZ4VTaBWCrgyGU7exUJeX5I@vger.kernel.org
X-Gm-Message-State: AOJu0YxPc8aExUnlSK/MYAazS+AjbTkWD5ElizUXdUoTz16zprx5ThY3
	B7oyKvth/raBOelPEndN3gZzjDeEn2XudXMM5qE4ZOvW6gAd83BgGkFJtquuc4Ky+Ofj6eirGQI
	Nnx0OFiKBqD7xpAdvJdjMf7twMhyCFPw93jVDD5j/ndDzrFrLpSeB8iKkP2RjXNRzWiqV
X-Gm-Gg: Acq92OGhbI2hPhGgIY4mhMS1uopELBDrh1AHjmWpdA7rV4phcg4l4DLAibUrnmyBehu
	YMz+iKEzv28I//lHWZsi7OtCdtzsrvwZRX6/9sGn84ll1Xr/+OltgmSbbVIFbwlpfKE1zOJzjvX
	rLBVLFegkyIy4ril2tqHXe4mGf/QH9ijJ8vPEYJgNpMTZTr6SduSlDJ9cO3BaLhd3qD71+/fx0n
	fi5XyjO6yq5/PvfRuATYqcW1iGcuCGIxaL7BQltCkDumikD0t0lI+yksaQITYIm6So9YAAVq2ia
	lc5ko4UhZJOItpqq30/n2aOqb3/1dW5tC9KAj1GWIc4qkYXQA4mlLQqVgEausfjQLXYxWt4KOwN
	zb7FVVgzFUtrJPsm6kelhKmhwFqoTxGXgsl+enG16tJcxp5/RharzrI1VDiT3YIf4uFs0BlnS8S
	fmaow=
X-Received: by 2002:a05:620a:2586:b0:908:a758:baae with SMTP id af79cd13be357-914a2cf3abdmr154517885a.6.1779353411709;
        Thu, 21 May 2026 01:50:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:908:a758:baae with SMTP id af79cd13be357-914a2cf3abdmr154515385a.6.1779353411301;
        Thu, 21 May 2026 01:50:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e77772sm17619566b.14.2026.05.21.01.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:50:10 -0700 (PDT)
Message-ID: <cd5a8576-2f06-4620-bbf3-43b3f84de630@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:50:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec744 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=LJ_b16ZpFTZdMs0EjWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2kuTiyTDSUMBXBIw-HScTfDLcmp4xmqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX9TVVDg6kcWtH
 9B42/kTZTcmg9R65IpV1t1uqwhUIB/O4aLdTPqgOB0Wd6+4KZv5jL7ODzZE3i7i6W/se9hI5k5P
 SoxcydExs3rE9jK/u0SdE548TgIbSW2q50O7NeedjQT53azlzdFds267BtcnpN8TM/ztzMsar2g
 +zbKrhtRUavz1r2pnfersErx7Vp5BWCUHqqkYjwTnVFDRaxyb4EF5+vDBQqe7YZEZ9jEfUNvtnz
 9XnxYaU6NYcWSImON1+SAZct39lQma2xbREJ4Ub4Y288t7Iv9LHNBRABXoPMH12Xfjv5AxhvZqY
 625sRNLzGCfXUS3Vi4H95VuVbtYcdPGT5vc0S2wIbvVnz6d8ZgFY9KSfodOGr5jTiST10oFhnZD
 M0NShWWFljXtP9vZlu/m/UkW9EirpIfCjHaRNr8TC9JMb+uMhZU5HXCYSOoFQqsUBN7XX45GmaC
 iBk4/FdgBZAYGzihD5g==
X-Proofpoint-ORIG-GUID: 2kuTiyTDSUMBXBIw-HScTfDLcmp4xmqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108970-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 162705A1C42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
> Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).
> 
> The enable GPIO 36 was found by decompiling AeoB dumps [1]:

I'd like you to strip this from the commit message, as it
doesn't add much value and makes the git log unreasonably long

otherwise this lgtm

Konrad

