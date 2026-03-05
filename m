Return-Path: <linux-arm-msm+bounces-95577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIDpCshVqWli5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:07:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E0320F5F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B91AC30A65FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A1B29827E;
	Thu,  5 Mar 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brmu9/RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzkdT8ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE879375AAD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704928; cv=none; b=L6vgQ4kSURS0wMocR+asJBvGm/F0MPqZVz1uYj5FWoCjgysxSwLYJYAoNyskdE04C5BqaXw0oXwFXDV/JNpVAPo9MRRmMavwu0omHqSpJ7YQGb0SPknMXCnscB+rys4O5MDUKeVgTgPGahe/bh2PjKDmoiQReUEjRr88q4ySYtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704928; c=relaxed/simple;
	bh=RXg2e8kwPtLqgu+p47pq1aAEIJDQlri2Z32TKUvQnFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBL91YJvJ3pidbbiqEa7gTWsZldHcgg1lGAVaXwxf4reXqQoV4qdb9AiL5nZTZOv0JUsZfD2XgUG+hxS6gaJoOfBut68KmcPlZUaEk+5oX8AeZLG4Ct6LrzoaimrOkIzJpCzV2wcXZkh7hTzp3lHhnppVEyrJFsoLNHG6BB29+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brmu9/RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzkdT8ad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258dQVG3482752
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=brmu9/RF7IkNb7vS
	GOOWrA/02uQjWusa50Vdsz0LLRigCGcb9iWdQqm4qkaE4wjH9aWdTeJQoGX8pXIF
	gWx6LSiox0Y/qsAci+Mdf0pfEhSE1ZGVd7tCWX/F04t7lWB5/o/mfuXEsavW1pqe
	wNr2rwDs3YQTcGEEYCbb+7lrMNk+7H5gzOPLRuBcjjto7wbzv9M8XZdcnZPekpfQ
	gFGwSz4oz0kGy8ZsK/RQJqRL85/JjoB8LL+6ufiEUZcEJSlMakUzDnXg8dVbq+lX
	6az8JKYOBUz+FKRyzEavLT5vMNSFnMJi6xILAaiuN1nYMi2n6aLamDcyl83ioOL3
	JHChSg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjsu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:02:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a1be41f9dso5570416d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704925; x=1773309725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=KzkdT8adsPDcTB6kTuUR5L3tDI7CHoCkxw3Ff8Rpuo05whCN51SGYUaaueMriirAHq
         rYNsJAcHzanY9QGB8XmU25ZZ0LQ0lgmPG5A5RRbmIbGmo1ax8y2XnQvKpITUheBmou7l
         YMfUBTWiDDjsdqxGTISKSvPkRT8oaBjbje4emaVzl64L/uC55Jqp+tczHxvzQbO/cpFQ
         TdOcyPAtQJy/n+gYJalHV0Il0eA28IyYvN5JstqRNY6sEwqyoJEduC86Pm2xX5cR6H7v
         HYXGCUilAqGfQxn/8zzTS9wkuhQtF4TBIVaUiQaPP/flyKX4sppyRkrWw5Lbt/QgigvS
         l0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704925; x=1773309725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=JrkPMD4yGLc5lm8cflM9r+BpACpDTv53SJcJsq66HhmSPxBOZClyJ+ogdosMQ6QfFi
         C/DR2sd10g8Qb/wVNh7VgkPbAQfi0uT9zfduurIzcFrp2EbUh2ll74aC6gFKThiHX9XP
         na/SBK/RIwaqOXFxTaKDb3eM/shnD6GGLDOZPrthZDhfSSuT+GUCFeKvJuA+2eRuIeM1
         b25hhum9mt2rHnHrrbQqYye6aF4tyc6CL6iBbOPJW4QZhiRkECcdgYc5NV0j6trjY3Tq
         2r/mJ3+zOpsFTUTDUX+8vWjplj0aJtVh6Cu8Da1Kqtt02ww6eCrO2Li0Ilcsm8yFpXNO
         UZeA==
X-Forwarded-Encrypted: i=1; AJvYcCXLYQzjTmlux0kCaDl7e2+hvXTSYKwoXvUMHSBl1AWvd2jTVejIIA9NkPcuxy9pyD0Oac3fha9f9HLhx/W0@vger.kernel.org
X-Gm-Message-State: AOJu0YyDW0rmg8sEjpGQfTDi8vXorBMUYOuivq3vnbfR+u5pHvqvKwoe
	cCiTM8bTLGh+qf6uAi8l4llBdGTDswTM1qSMc4C2uea/ZUOZybqXS+2J3j5XQZDm99feDgED4xq
	oLUdDay4dl46lPWW/5G6k7S/bOqwgq62Dpe9sow6jyuUd6+5yreMlnFz9IUtHax/qvJns
X-Gm-Gg: ATEYQzycCzlrrxC8x+ACefK6uZ89Wgs8SQkHEjAuIpeUvmhBoeAOzhjg/zsS6irueaY
	06ebRQJo3NPax88lliZiwUAw4BraFf5zIwdakWQPFC5sLe9n8KYKitw7JwI3BSTQRRPqfym9dSj
	y3PFwFK+Dvd1NSmtzLL9RcaKR/IiqME4w4FVOABPFFIaL0O0eqjYdB+yRlN0XkVDMFWhRENCNkf
	aim31OD3OqOka19HGA3One5/W8ldJzOhbbZaSzg9HjdsrxFe1aTfr/rSiOr5usEfYEJMA1VCHVe
	h5Cwnwmytl1rkE9XLmSE8lMjMVN6gGl7KpcUMCM2eK63iKrkKcCuWH4LzMC67uMCWhBGcZS4Eqv
	2MVRT8arA+BBdJ79ifKvK+7liBAzxa+b3JkleJ3xkPIlMi8FDPZngZwoqTvhACLdYjVxBxpoz8J
	qRry4=
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47022416d6.6.1772704925331;
        Thu, 05 Mar 2026 02:02:05 -0800 (PST)
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47021826d6.6.1772704924860;
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Message-ID: <24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
 <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HzzuJzzAGNhucMJwZ59wUSdzrhdgz9dt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfXye6oLIiIoL9p
 W+DZLvvJOzwQGPsGkj8py674+seaD6BzBLWv+9NAjrknD7AloaFArcH0/hrHtYjHqMrb4MEhEHn
 ohE5qWSYd6v8Sd9/YOqSPPFbtcfJhhsKWSIvDl+rA5Mmkh0uK6IcDb9FVwB+h0T91/dNfnwY2GO
 Eb0IsqF+tg5zz5T120L3oM45XXxYTIaoqPL+tLI3dcGG/UuInXQHNz/0qZF/xtIqDNFWkoo7lWF
 8haMy52hT3HCus94PnrddlZ6fSUj78FfbNjaJ9Z/oSx3hjraz2osenR1DDkWbmlO/okO10PvLoN
 HMQJuV6uJUsZV3Cnz6wEL9jCUjg4i54M/dasNaMbmPUu7xPV3SmlTa2AuPZrLZ0ogwMM2Exktr3
 Xpm/6mlTar975ab5FRJIHKwYsKlfrDlECRV+6gDyAg+eWxfDSvZnzSoppbjdRTXSLbfqMBoeuqh
 BqYvYQmxbO+AJ9ki9+w==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9549d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RQncaQt55EiIgf5kr6IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: HzzuJzzAGNhucMJwZ59wUSdzrhdgz9dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-Rspamd-Queue-Id: A3E0320F5F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,nvidia.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-95577-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 10:55 AM, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
>>> Unlike older GIC variants, the GICv3 DT bindings do not support
>>> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
>>> series drop all such masks where they are still present.
>>
>> I'm having trouble finding where that's used on pre-v3 even.. does
>> that actually get processed on the older iterations?
> 
> I had noticed the same, and had asked maz on IRC.
> His answer:
> 
>    "so far, we have never seen a GICv{1,2} system that didn't have all
> of its PPIs
>     connected to the same set of devices."

lol, that's fun!

Konrad

