Return-Path: <linux-arm-msm+bounces-103723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cODBOEv25Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:47:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65429429055
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6905304F214
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA8B391E72;
	Mon, 20 Apr 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiSCxw1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGTsHIuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0C439150B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678352; cv=none; b=ufRTeKe3N3SbxLWrvwUh7fZV42/ROHdeojG4H4nRiKgxWiTZsU04BL05P9Zt62cbxW2/oCANdPNdEQAVagThXD06bPRVf/fsyB/LWvYF+3khddIzJcGS7iwOs4RVSoN3ZxyS6r+Sjs3CocqmWvupFwc5Zcc57DC5CrMpk0ZqADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678352; c=relaxed/simple;
	bh=VZM+J9wy2pF1ST1d8Dr81X7N9+uaPGz8QDcnICd3iqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnBa8cHC5Q06HwLMxXB6EfTnYdThPz1meD0ji1TQnKLopSnJh0dWJ/olKkn1KsJmSyWxCLMpQIGRt0Sa/GMU5Ls1PGwyq087aEl/4vnINyLeRikT9z/LaewGKL/RcLU7BqVAxhqfthiZZc/RAhqMu77jvCdrGtWwfbVGTJyLfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiSCxw1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGTsHIuz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7U6xo1544870
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/hxKOQR8knJ33ZpSAKDOQasdw+ZOshf56WwdR5BKl0=; b=QiSCxw1ZmDjeAXwj
	lw9HTuS8A+MxK8UXjJg+IVbXrqfH5eYBalisABqBkjHRr5E2NXpPkojblhXPAxNE
	SE/OyzBuLp8b++Z+fCJ1D/ymAkqPXvAu+jEAHyYO6fTsQi030qmnRpiNtdRvHDjq
	60T/qekIn5V5Yetm4gm7/GpNLPuSUVhhPdXudLwxkU2yppoLYHpCVf8DWu28ftIh
	EakKcyGW9zb7j51IrmXew1QUcpZsgv8CLGknYUyzXUATFQRPp+D9kOOuMR14KYlu
	DbjYLYwdFFQoMKYpHv+c6ebMYOf12QUy1RAA+dmhEvuqJFCGNMhoGzKYHDfRUFFX
	Pn2h2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr5m6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:45:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5d7f4b63so2171851cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678349; x=1777283149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/hxKOQR8knJ33ZpSAKDOQasdw+ZOshf56WwdR5BKl0=;
        b=PGTsHIuz0P8xAwoBk/2D739IsiAoBgM6meSsaAdPlw5nXDai00t61WiyLo21L3thMa
         0Q7AgIuYTUoG3+9BthTiQjejARMdGagTDUwm45kRtsaaOfZ/OEp17a7TywVM3mITTU/i
         eVQazrtuSCEAdARYizYX9aqF+rKfXghIQqHaI8YzY/jy3HaNaAwkdaiODo+O1R16cYED
         8vvZbOWKvYc0YV/WhMhns1ZbxA3fSVP2b1Thp/DokqEEzrh4IuYftqbEaiWd2WCi56yd
         Pi71ov0zZZcKlb3kbagPjjBCg6yh4YUwnioCz5JvR6sAtVZShFUDg45NsaTksz6psBJx
         qV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678349; x=1777283149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/hxKOQR8knJ33ZpSAKDOQasdw+ZOshf56WwdR5BKl0=;
        b=bcOZQPRy7FwgvsneNtQEDVDMQBY02ROfRVkuF6NrRCQq5qIs/Gjl4qKufUo3aTBEcJ
         FQwCR0r0R73op/9UKvzap1S1E/UFLwmiCGEkHoMTBaN6NJSaZWOsEZCWbIEsuKSvnqEl
         wf+ZitgVVRn9pDyub0w1L6xRiwYAGFR9EY2DmZ4300XeE+8ckRKrcZGTmE3TOF3UnPNn
         tICa/AJf7BdN5Y9tXqws7YOwcG1B3K/x6Up9/3mIlkYGL79pTMcEOmZ5e3eI6AFT80WN
         qSAg6+qZU8ujhPZ89inWjlLW53NSHaG6kEqSyNpEFhw6B6+6iTipNJB0CDSAKJuzqIk/
         3/0g==
X-Gm-Message-State: AOJu0YwNnpWtuBxS7I9PHbA18G4UshQY8pyeSJGm3hgqqTagAkKR5jmb
	yjwZObRpef9bHSE+nK0z2xH+zrq8qwcyLj3nXIokEy4zEXqJORAnRqKfKfarHfi5RlarPSsQ+Gc
	sf9CfboPvLuuNbLsA02zFap1MafWZocy9fZyunXa/PeY+Ywi0DGBVJ6n/Oo990mjRhf/7
X-Gm-Gg: AeBDieu/pKadWiSehDeJXKNnWgOx1DwAvKyfwxWyispK3jj4+UGnF7ifya29+UbdiHb
	8MOIFW4/ymem2Qeh6nw6AMjMMMDZRxfubKhcpFDmjYVHQNghKnE5WzhjhhEnBTZWzcyjkrSi7Ke
	0p0tASp7aDk/LULghbFkOhsCCjfJI6QpSpz5GdlYz9quYZjT5AHWSwP15xJrIQSHBFcYddUiVvO
	INvmwp0pSu4TjVH7XPMRuhq9kcdysbLJ6gMo5sp5CLCOw892BfG0FC37LBKScqLpLamW6HHAnsi
	3yEhoo8Emc6ly6Hl1IuXEo+bDDTBIIKTUH6VC3CCTznKGdsibSsUIixdXZC8UhyvkXkvUVV84GL
	MOS4/Uu7sr/lJhAlZ2BQtHDvf+iuDKei1M65nYbvJfuCmxFP2mRelXRizNXN72pG6lvFEzSBYcL
	5mDwSUHHV1LW2WLA==
X-Received: by 2002:ac8:5e4b:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50e36c1a80emr125781231cf.4.1776678349595;
        Mon, 20 Apr 2026 02:45:49 -0700 (PDT)
X-Received: by 2002:ac8:5e4b:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50e36c1a80emr125781011cf.4.1776678349072;
        Mon, 20 Apr 2026 02:45:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm334359466b.6.2026.04.20.02.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:45:48 -0700 (PDT)
Message-ID: <26b34f92-c336-43b3-8054-9de3379ce01a@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:45:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-7-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-7-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5MyBTYWx0ZWRfX3aaNWgd++RTM
 8c/yXM2BdKpUSVUXCztHAKKMgVY8V8SVSzqPEtB/6O9ZLzJZXJ0tq6hKmQ39rpoEQTrGnuXRKot
 haHo8/wOLC0fTxRBapeuhD2JhRPVbToB8ZS75Zk+YqNrcsYpx60xys7ZhH0/xsqdZqLuokp9yXu
 7f2RjMGfkoHQoiZRoP0QqTq2i7l33zwn0CDY6zoVvBuTL6imPScwRlvym+Hu/7AAVwq5C8y6+gb
 QEl7wnN+Pe2OCSmJBOGHQgXGnQYKcTr/DnlU/XQDwPgvHz8ooorNa3877NpqwiWILtBbq0RYXMY
 PrepZdPg2RNVUUFkZlHbwYBeMYWxndticTMtHF35szZxRzxsYFjRdR/bkP0GeWh3cvhYenih/38
 LEUb4TnKAG0J9J+Q+Vx5HPJGUKQ8noRjp3o5mFf3mofLyniCN5jnOcJwszbD2TfUC0g/d1i5+oh
 iRBmLJy7Flj1eGbGsYw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5f5ce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Qfo_qk6ajyruwQE2hCAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: cDFwx4wNm907Z2eLBvTJzLd33v7wHmAf
X-Proofpoint-GUID: cDFwx4wNm907Z2eLBvTJzLd33v7wHmAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103723-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65429429055
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without this path, the interconnect framework cannot
> correctly vote for the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

