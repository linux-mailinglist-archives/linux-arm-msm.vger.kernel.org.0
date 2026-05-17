Return-Path: <linux-arm-msm+bounces-108073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fn/FK8RCmpRwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:06:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C031A563765
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 21:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FFE43008296
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2E72F7EEA;
	Sun, 17 May 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACmHOvnp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3mzC2R/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65092F7F17
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044779; cv=none; b=GO+ipnmhfYEeM0hAiNgfz2kN4OHQc31YQ95Y78buhLFJdPWV/qOeGNlAoUMH1etmgPzhPe2YbOmXXXArhn7iANWKdnK7GojYb2xxQMKHFA/Y1bKWzT9BBcvKtdn822ecuKXdrB8+Mbc64xCllKLeMISFDEQv7fLZaejn4WKk9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044779; c=relaxed/simple;
	bh=/x9LxNzmS5J8ypNDdwjQsG84LV/SknFWY/zG7E8fPZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odDGVyLS1sWQFnEuaEnwXVx/yq0jQlyUpyrwDYm/fU9x68B9rG7BUhODavQrIFXe64Bu0dyhkqZsE5WBaCO+Qul3ekSlGjTYGFobX49BImnbvbbm5cKY7Dmgv1rwC3dxvUyB3CSM5ESIqVCGyClQTzuFXsvWVagc4OyfyM9GihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACmHOvnp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3mzC2R/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H10Kpc1648792
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 19:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5CTp7WWFll3OVumVrIQDCRGiPwlHUxMe6Ct4Tld7Hi4=; b=ACmHOvnpQPi5Zhuq
	lHPwg6xZ3Q33aOjHXKqG/xofPsZZ8QovFsSbr//uC5cOusHZ6sr5oqFroOqLyWza
	iKBnfaK9D50elFGiFSk5cQiVYElWN3BgbHU60Uw5Zse2NmOI9KyGmGw9k6j+GR7g
	OSX/YWQHVcHniwHZZAe3ll+H3XxPw244PCzigUubsBI0lGEFRZJgkp/eaLXDfouj
	KSQ1/i/Iz9U6ZHh2i2tYjQCax+Vr6mxJSNB8JYAvTdD1JPR4sI+LPyt//hLXUgMy
	sWvFkoRX0EMPOzzghp35RCXkFof3OOy9vExE9bJ9qZRwGxsy6y+jdVoxU4tx7WD4
	osi7ig==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g3d8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 19:06:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835444b6ce1so994309b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779044776; x=1779649576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5CTp7WWFll3OVumVrIQDCRGiPwlHUxMe6Ct4Tld7Hi4=;
        b=R3mzC2R/SCrcLQNns2mVOstqal+9xMmEkWLZT876DFAw0gXVo+K84jYb5+X7fTzO3w
         uCNDXM8t0E6UEeP+/QyDR91cv/RnEzg3KgnRtv4y81vJJNa9lygtZVPeTPsOFk/CKkJt
         FPYde4AsiECjbsKrBM/tXzXG11wJ4XlTLJPy+F99YteSAg+QI1IsY9+dkBSq9t+HG7Yh
         nO6qZW+kf2B6hquEjakVKVq+NUVyJCbBIoegz1s35+mfzAy1+5lybnESWYp+fnYWVbNd
         D+iGflPJIL4cK7w3H/qmXu71wOPgIBYu3lIny0cDUhIdbB17Y041wzzOzYHlSk7O0xr5
         vKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779044776; x=1779649576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CTp7WWFll3OVumVrIQDCRGiPwlHUxMe6Ct4Tld7Hi4=;
        b=GJy3akFgC7093cyv7ZMS3t4zcGj8L3kQzKIHMdAK463KWgV+DupDLEVohfJ4BflW+D
         XmbkMIl2BX6I3SJDUscfv7Who5h5uE1uN/CRR1x+Vp6f4ZJbi6y+GGjIk2CCzozAPpO4
         BWJ0l3tVrp3LHRd5btcUG6n4dLRz+HEbmPKPk66qvPm6Hh42D5AHo7WObAkRyq54tdG3
         wsPA+Pd+sn8JhqrTlx+3fU7CjCGtwpjwvsJhPuXnDzlVjLDxhwLYxHj1ix2cnHcvOUP7
         WS0iLlI5q3gYW7+P61MnbtxrCUYgSzIAYSne4UTOYjJKzEUV5DObdhukKMS86xEt6I/h
         szAw==
X-Forwarded-Encrypted: i=1; AFNElJ/xLcDkIw7NTQ2eSx1bNEPIvO0qhsJfJK1cwobm46/rzWA/7brhi6OP2Melt4MisiRtGrZ5lhxLykMyRfyS@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPyKNy2T/mEm4p87/IX8oE6CF9RzFLds1tBJoctxp4r2xJS6j
	4zQknybpDFBJw2h6VRHib8Aoocd4ujBYZpIilf02EObboiYRGdj5uXDfsP/6SnM27XWtgXPeEbi
	n9vpqbkaCg7L/PpIb34VGBe2lUvUqqR9thhO9OSj1Tj+lMs/1rE3iY3IKj/YOFJ7r4QsN
X-Gm-Gg: Acq92OFHdCN7BJOlvLLYlwzqksPeCDxHqlxkI8HgRFWPmmXap2SiB45AlzT5il0ir6e
	52SQ1UhAgCAHbuDJOO2jEyOkEp+JzbHIxhjHFPcOxSyDBbFnDJEX+i2A63M/vGhn8iicymAevdk
	XBfWSdZSyoto61igzzXh3w52l8DgWkONGKM1VR7OsY5I97hYDAr471pwbMQPKPnxUu7mLVoQrvY
	U4IfwjpjTH3iMxMCDh68oFAD59MW5aYNPZnCL9QkehSsOtNUKXQEKtQ//9tvh1El4cuTjr9qNFv
	PZInvE6I5GNE7riBSIt9wF/gtATyAKs9z5CFDi0Isu2gUDKwcxDbNc/jYvsaItwDMYJGtvkWetK
	/hX/RnSE1LGHX+koZfiuhfxf0UH2PvRQcN8rb0eIZruOLUG8rlcQ=
X-Received: by 2002:a05:6a00:4fc8:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-83f33c961c7mr12510760b3a.11.1779044776087;
        Sun, 17 May 2026 12:06:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc8:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-83f33c961c7mr12510718b3a.11.1779044775544;
        Sun, 17 May 2026 12:06:15 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.235.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f8b8b3sm11579843b3a.59.2026.05.17.12.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 12:06:15 -0700 (PDT)
Message-ID: <6df56ddd-3cc2-414b-882d-641277ce1a66@oss.qualcomm.com>
Date: Mon, 18 May 2026 00:36:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Shikra CQM and CQS EVK boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-4-716438330dd0@oss.qualcomm.com>
 <mw2ipu5z26ubmrg6qe2v36cp6ktkqtbpfe3hmr434qdgm66nz4@pu6yy7hw4n3t>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <mw2ipu5z26ubmrg6qe2v36cp6ktkqtbpfe3hmr434qdgm66nz4@pu6yy7hw4n3t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwNCBTYWx0ZWRfX/9yXyJFEwW+j
 ptvk8q6TCvkI4ax2NomQIQZCyIbWPsFWErzNflqKYnGOOH7GBsJeXBSYhwCIcVi6tamyv95I4nA
 IBytVmLC7qlK7gKOq+JeU0cWNIkdgDW3k7U2Rh5lAuCzWKHqcl6s3SQNTJ7V0rEv4WoLf0khEKR
 c8G0jKldDzp8vREaNU0CZgbVTwLcACIJY+r2wrvmBIFUSxaBtT4lt/2JsaKxJiwALFn4wnSyNV4
 PbFjcFAyZSBpMeNemkH+N7KonJ1cHB5HLLmkCbntyqZQv9/gIzsEatVsx62pBaYzY3XkB9U5i92
 341B9exDOoIknzdaCtrZ8Y7Uh2SkKprS7tinU3OwJOeiveRdvN0k68gBp4n0mRzdYn0pj4Frukb
 NkO0xRhK3llF3JPOtrUbYmWEkrXIKVI5ZaM+7PWK6GkaQbVj1rOqT4Bzm4eWxb5ViWUsKR91/J8
 mRPQUXiUDyuTNZq8f0w==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0a11a8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=g4/7f0GlZvY0MGcqtTB0Sw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=4NbkJTruBT-5dyiUZdQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AyqfCMJpGRBhFOatfyexrD5ZdBLahYaC
X-Proofpoint-ORIG-GUID: AyqfCMJpGRBhFOatfyexrD5ZdBLahYaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170204
X-Rspamd-Queue-Id: C031A563765
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108073-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 09:38:07AM +0530, Komal Bajaj wrote:
>> Add device trees for the Shikra EVK platform, which combines the CQM
>> SoM variant with a common carrier board.
>>
>> Two EVK boards are introduced:
>>    - shikra-cqm-evk.dts: pairs with CQM SoM (retail, with modem)
>>    - shikra-cqs-evk.dts: pairs with CQM SoM (retail, board has no modem
> CQS

ACK

>
>>      support)
>>
>> Also add shikra-evk.dtsi common across both EVK boards.
> What is the split between shikra-cq[ms]-evk.dts and shikra-evk.dtsi?

shikra-evk.dtsi represents the common carrier‑board and daughter‑card 
configuration shared across all Shikra EVK variants, including CQM, CQS, 
and the upcoming IQS board. It currently enables the debug UART, eMMC, 
and USB along with the required PMIC regulator supplies.
In follow‑up series, this file will be extended to cover the remaining 
common daughter‑card peripherals, such as MIC, display, camera, sensor, 
and NFC daughter cards.

Thanks
Komal

>
>> Each board DTS enables USB (peripheral mode) with the appropriate PMIC
>> regulator supplies for the QUSB2 and QMP PHYs, and eMMC with the
>> correct vmmc/vqmmc supplies for the CQM SoM's PMIC.
>>
>> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
>> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile           |  2 +
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 61 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 61 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 13 ++++++
>>   4 files changed, 137 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index cc42829f92eb..6de783bcd133 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -328,6 +328,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> new file mode 100644
>> index 000000000000..12eeca84832c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -0,0 +1,61 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "shikra-cqm-som.dtsi"
>> +#include "shikra-evk.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
>> +	compatible = "qcom,shikra-cqm-evk", "qcom,shikra-cqm-som", "qcom,shikra";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		mmc0 = &sdhc_1;
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&sdhc_1 {
>> +	vmmc-supply = <&pm4125_l20>;
>> +	vqmmc-supply = <&pm4125_l14>;
>> +
>> +	pinctrl-0 = <&sdc1_state_on>;
>> +	pinctrl-1 = <&sdc1_state_off>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	non-removable;
>> +	supports-cqe;
>> +	no-sdio;
>> +	no-sd;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&pm4125_l12>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&pm4125_l8>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> new file mode 100644
>> index 000000000000..bc93282f64cf
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -0,0 +1,61 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "shikra-cqm-som.dtsi"
>> +#include "shikra-evk.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
>> +	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqm-som", "qcom,shikra";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		mmc0 = &sdhc_1;
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&sdhc_1 {
>> +	vmmc-supply = <&pm4125_l20>;
>> +	vqmmc-supply = <&pm4125_l14>;
>> +
>> +	pinctrl-0 = <&sdc1_state_on>;
>> +	pinctrl-1 = <&sdc1_state_off>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	non-removable;
>> +	supports-cqe;
>> +	no-sdio;
>> +	no-sd;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&pm4125_l12>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&pm4125_l8>;
>> +	vdda-pll-supply = <&pm4125_l13>;
>> +
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> new file mode 100644
>> index 000000000000..fae8c75b68b3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +&qupv3_0 {
>> +	firmware-name = "qcom/shikra/qupv3fw.elf";
>> +	status = "okay";
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>>
>> -- 
>> 2.34.1
>>


