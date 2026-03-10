Return-Path: <linux-arm-msm+bounces-96567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNu0K+njr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:27:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B722485E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 179A43023D7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079122C0F6D;
	Tue, 10 Mar 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rn0hRge5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFGQLq7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E82363C56
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134749; cv=none; b=hz9JaLZJW/dM/Dl0GMVib+BtrLOSTfzfDMlW1nKnqlJMb3dzJQVZwvQ2B5ovu3Htw2Y3K5UcnMcUaF+yOe30oMRpaGPaq/+U5Z/EM1AYaFEzpuDsNtLSVj9jvxD9hj1qffcs9Kn3L7ReU64jB4bKc9KDFIUmnzRqEM9OJ1ELM00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134749; c=relaxed/simple;
	bh=jZgtP750FUWYeO1itBDwt8X9mVUXc7Q5nFzfsL3PrbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMRGnPc891mm8hg0Uxu0K+SE+BJ2rJnKFfa3wkEyfBDgCIiFvFDj33Lh35d5ZyHNEjPIGRj96O4e3iCKcPxauMKeLQNnzZzswS9P8dXWhcRpfdUz8sgJ34EYx1VrKdIkgRr4QDUKrvO/9jYTWKarEGeDp29vsIjnMNRxoyOGgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rn0hRge5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFGQLq7Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8pagm3690628
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jlyq6GYdL2QqXeKG1FxVIJMJFLp6i6OBoNIB4BeJyFk=; b=Rn0hRge5rFsx81rt
	vDjwHSRCwNxH6liJSfgMd/bhrYOx2yId/06ZBdMu98dRRZbiVkKjytuw/Gu6reYU
	GnrZo6cCxGFCKezQntLWVz53BRjiTZnHiZ9+CwigzjDQZe+EnGmmvClfqVEjlj79
	NIvH6tOt2479bvHcGOhB15dkiM9jbSsKbRcPPhMuu20ObulASDMOu0x1fyUcJDRi
	0wBiIT/Q+941mKH/zPGcj3KdzjXhK2bgplS6qPYIOqTsVxFiwKLAhYkIpfpZ0T/1
	3a31GuJ6iV1Kn8NlWK2lesr0QXVhisjLXnGdjirpAFztgCbTw8agNk+uiw/xvorz
	Y29TpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ng4ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:25:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1364703385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773134746; x=1773739546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jlyq6GYdL2QqXeKG1FxVIJMJFLp6i6OBoNIB4BeJyFk=;
        b=XFGQLq7ZpZW0eVX86fI2341e1pnK/QzGEqD1tbc0rQCuiT45/VhOLbtDk96kdVJUSM
         iYj86/rGAM2DAl8wig+ROvBz/seX4OFxVi3AUljfbsrM1PUDpfcyYcv24MXESZst1spC
         j7DpJx9kk93g/1Mi6XG6ZjZyHX1FkD0ThdB8x3dFy0nIrLKRFSN/8kqOB86+L1AhCylC
         9wwdWJKpTZziTIti1i/bXe5WJCEqMPHxYiwA9efyjjoVJw8yULCQyT51fRY3xXkH+ct+
         PT7Cmg2kxHRCkucgoVBQ/GjqBKEgafSR/+bZJ0aJsHdQY0Jzuk3IDDDR837/3SmHx/L3
         mNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134746; x=1773739546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jlyq6GYdL2QqXeKG1FxVIJMJFLp6i6OBoNIB4BeJyFk=;
        b=JzgOw3db9BE2WxzySuS4IRzmMCYm5mD4pulOOIf4PFvtvTfgk6CJLqlYWGV3YijMMY
         DcsUjJE2jZdo8JzAVmoQ1mra+yKage1sUWnCE6kwuKnmq7arku6N0UXw9JGX/sKYn0aK
         3w+9FToF4FQ7NREaNPFa4bgpSF3qepb17Pz2yV1AJv+FVW/m0BO7qd2TXD6b8CrOqNYB
         4GDYiBMCkzO9DkHGzGTh/2UzjoRGWD3G9yZzTPIK7sLrLVs1arCXlINEQaZ9PM4nF3ln
         dHjox81b6oOyIz+IDD1GuFowQrHtcaUibwl6WFuE5SKQ9R7HAHbUXofkwwl25ARA/bzC
         +ifA==
X-Forwarded-Encrypted: i=1; AJvYcCXRQnMZlHLIvhgS83t3yL3VRP74uRjbBFHMCkElhRAKSLz2CM4SqN1qaAb7Myp1zQRxfGVf55kEaEZnHy0A@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8bmInBEn3o/gLE1CQDgmYfQXBn17nGtqOfbJi4hfRcEIj9Ra
	EmBO6W1/eeJtJhDrWnHCTZiuPU3ZAnuiX0ZRiOmZ3RvE+CDXxxqBmZ9nNSY4kx8shFtJhSKS/fB
	o8jmMjxEg2KqBx6chzIUY84sOF5AOl+5EOOnuGU0znlLvXsJCDvLh9oYMri9RfKB2omey
X-Gm-Gg: ATEYQzxJi6svXRnUNnGN4Q8CSGKbMeC5+7zoRMSxEb3Izei6/2UqRSI8+KHruWyWp3e
	k6/cW7JVbk8jRklXQsXMOqj/Ol4TkdiTHnzo5xh74QhO6ljqxwCxvi31tFEaK2wYIrqg9cs9V7V
	QZY2x2CVatgB56duZOR9MyQblp1mnKxOuwdjjOpQX10upQW5t5GlcCbFq4qTZcn+pewC1NnLpJc
	Bcs/4d6eilNf+vSZ99STHOZRyhqyO8mbs3u8i7Qmv4Gtub0N5pOHpnKEjJp6VKBID/Lr5WUedwP
	t9ma4zSEfUzPN1ZKNlA9myj/nJlD2yj9uKBVd2wS8RVGRMeDH2bQt6bsRYNnpsda9KWmq7SJOlK
	w51O4cFoxQd3075N8wkWbi/Lm1zz029B2UOGakVq1+0kpu6vC
X-Received: by 2002:a05:620a:1a8b:b0:8cd:8938:effd with SMTP id af79cd13be357-8cd8938f3b6mr778290385a.1.1773134745822;
        Tue, 10 Mar 2026 02:25:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1a8b:b0:8cd:8938:effd with SMTP id af79cd13be357-8cd8938f3b6mr778288385a.1.1773134745396;
        Tue, 10 Mar 2026 02:25:45 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b942efb5bc4sm463208466b.30.2026.03.10.02.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:25:44 -0700 (PDT)
Message-ID: <6da0dea5-da15-40c1-bee0-6e80229ebca2@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 09:25:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: monaco-arduino-monza: Add sound
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        geert+renesas@glider.be, arnd@arndb.de, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-7-srinivas.kandagatla@oss.qualcomm.com>
 <mnehsjwwp54sk5bck32emtw3e5t66b5o447m67po42vahydkv2@cdnc7yzzkwlx>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <mnehsjwwp54sk5bck32emtw3e5t66b5o447m67po42vahydkv2@cdnc7yzzkwlx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 074hZ-VWePTAE7ZqNwwWBtvqZfsoFTgP
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69afe39a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pNCWrsc1MSpuvQEHcIIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 074hZ-VWePTAE7ZqNwwWBtvqZfsoFTgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA3OSBTYWx0ZWRfXybPwm73qJbkb
 5iZ+fjgN4dUphtwfkkboj9qLP2gAkCqZZ7IfC3R1F82rYZPmYuQNjQMruCwsMNEpw1I3elqDbXB
 cr0DZs9d2aMImlMHg7e0tgODuXR9bcy9twcnzVwMM5wPzCi6X0pKzScDv7ILLfhhk4XZfDhVM6/
 JwHjXLnPni1JD3mXs3NXBfKNzJy2BQregyNnjXD32gJC4exC9pSiUrIz+WnIPGVkK3WqFGeb8jd
 aS8bynhc0k1MoOAERta6Dyy6nAu0TmPCDhkmBL8drJu/IyU7eG8R7flUEVpqD1vN7lBBWfY5c5K
 Wf43fZ3dvOabp6FHGjulzSasSpfDCAgoLo4Fcih/bR6o5JzPSweWarDO4stBOlGAUQiV40yCYfc
 Ff9ik73AfYAvm/jK5EuYmjuLhHhRWk90//Umpu6w9LWkuH7ijYkONSms0ci4HJazABiqndSt9/3
 dw+s1t4dHZQ1+BdWQjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100079
X-Rspamd-Queue-Id: 03B722485E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-96567-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 7:38 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 03:24:17PM +0000, Srinivas Kandagatla wrote:
>> Add audio support for Arduino VENTUNOQ board, which has Headset, Mic, Ear
>> and Lineout connected to external Maxim max98091 codec, HDMI audio
>> via ADV7535 dsi-hdmi bridge.
>>
>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 66 +++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/monaco.dtsi          | 55 ++++++++++++++++
>>  2 files changed, 121 insertions(+)
>>
> 
> If you've added the file just two patches ago, why do you need to change
> it again? Can't we squash this into an earlier patch?
Sure it can go into the earlier patch, will squash it in next version.

--srini
> 


