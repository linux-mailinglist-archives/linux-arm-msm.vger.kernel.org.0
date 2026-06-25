Return-Path: <linux-arm-msm+bounces-114461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rNMIo7ePGpetggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:53:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E010C6C382D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:53:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A6UJJ4mc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NlgibNkU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114461-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114461-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ED6830A6A86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7AC3749E6;
	Thu, 25 Jun 2026 07:51:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094237475D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:51:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373897; cv=none; b=Erd2CbtN6wAZMHsGxDzNX4jZU8oweriH5nZIJNmciRZY2ZTdaIXGQPFfxECL30b4MCxLOuYKXSErRF+Xx11kbz5KVUqrMn/8y6xTtPAobiGX48rSpDoXN6jannS09wjxq1IF8oM9xk9kf2MUrWQeMTR/LboOzArTcReIlCvbG5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373897; c=relaxed/simple;
	bh=IhddJ8wJua/m+ug2p6DPU/19D/1A9Q5EUbXR5cH3xDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHVkvySZ/V1qWQOTYcYBi1vzra1H/2mx5QKIWCGVzY5brCdBKctpT6KomV1AB9QEtcw39d7uAnA7+IKBvlJxpCujVZHit+RYSgjTbVmld/5kUGXlxxr03r2OU95/u87wQTcxGdhtVGXEuaEkO+hYpniGcUarHuUpxYi8ZWFKVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6UJJ4mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlgibNkU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eSaf1103543
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LTkSUI+YJToHS8a4HwcpVIMbbMkUqrCKJ7kdKLzNKU=; b=A6UJJ4mcHbqUjDYf
	Eov29aBmQqnUI2JQSICLlh0i0+MV00o7JJvg9xvz5n1S6+aG7QBrZz41TdGOc/uF
	bJ4kdfCziNq1+LH5/CfpAihwd0FUY3CzWG3ECu76F5EckGc93d4Zn/uzRhvTE3Uj
	8w74YPmuvmcqRpXwzBjdSPkJ0KXQFVb0BN8azOgT9Fud6GRbLEjarsrS0esqTu3v
	qiY2Cmy862MhkpMmk+GkSzse58g+tIT4Qu4rt9PgOHHRyRCCLHRnlwQ5l90uRzGR
	5KM75Lw3bPNwe1Ki2vS3GvAu4iqTtWeKYmYI2EuHX3ixxnIS/u9EqNGdNOkWopr/
	AZwVLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu94f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:51:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-921ed86ddeaso338055685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373894; x=1782978694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LTkSUI+YJToHS8a4HwcpVIMbbMkUqrCKJ7kdKLzNKU=;
        b=NlgibNkU9FgRQJ4VWU+9JgVnA9Rk4awtcAkI4MoV7JlEkgYvfGR09k3+ofTZGvXhbe
         iZYh+iTdHowXrnxZERMGILgiwaP23iG830iM/w/jvVJUrPzi2wC+yIqRjfkLGRM66tkZ
         vlIhytqyZjP+tkxCXZWSjg2qttNTOpMXfbfTHgVWTGTCpySZyvcN124Zx+vskG32HFiu
         c3k7BxsbXuO9aqy9vDV4RiPZpq6JT1tDGAn9sbEYS0B045DLUm4k06EtCGtYNlXumMIB
         WXj5H7zs1WkiFXksHhA6i3yTzIeD2A9iYyrS0tJRzBo3NoxpnIIXDr9VBhtHSPHk4fGQ
         m9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373894; x=1782978694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LTkSUI+YJToHS8a4HwcpVIMbbMkUqrCKJ7kdKLzNKU=;
        b=GIWxw37aAHwmbhP6cisGYIXnpx4glbWeGBskuYdVVJycLCRCaFYpqSSQUz1XXc3Z+z
         bf/b7HvluCSiQI2WQtnSR25mrHoSmLQc4YnTwD3Cr3ZsuJR+3m2LiGPHZ3nC+KycQlgC
         xWZ3Nw3CJOdK/J2LEUoLt7zctIcGa2rh7HoPBd30YMQdDI6YL5oPmd7HnvD8+8LvDVMw
         I7HYt7vDalFJ7HNjvw1+dTtt5PcRAiU/V4wn2WWi0ZQNWlyvRGcwjGD6KWrUsdgtSoiM
         G8VZxGlNoAjv+Avwmccf9XguoLeQerXyn+jyZ2oKPGIbCBK54ztZ9F3AzuGzfbBmFW9y
         BnBw==
X-Forwarded-Encrypted: i=1; AFNElJ9gbZXeVQD1IZUESHQIXIDXxQtBE+l0t6KFa6hs6qy1jHwRNehMsmeAbxUoNNhWFBb+ZLYmy2rr8aYdF59U@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBznBHpb6Qshd9ee3TObmYvtSlqcPdLAcRM3uDND3mwFmkyh0
	DUznxWL6eY3pR/mGqvA2VJluKNdEopTnsw6QrnnMuyzdL/d6Xq4loSfkmU4GY6VAOhmtYKZMHlm
	cHdx+geCUgZ1y7R6Y5E8SRqtJLfLXBANcUXWzoOx7EC/8SFk8vsx4iCxEw3VdeU7o6BP5
X-Gm-Gg: AfdE7cmuyDjKAy0/98HeflwFRU9YRbiMDB0FXQVZZ7OBgz6pT8qjv+FnjSBLbesR/su
	wgdSCWfYxoLGhCQdiPXarzVZ2uzAI7E3ycJrPTOWAwlve/YY1eu1OIodK1e98uWB3uR/N1YXBlP
	0RF/N0noxtwNZDxkDbbjioLIMyEcO8ExjsTER5rMG0TsuVPOBmt0q8RhU8wy1LfAMCw0UDq7dD7
	puMrM35ZL7jW7WZf3Ud8dQ9RyYtYhJcBHl8ojOrj9sjgjdah/vklPqBwLkwZbbl4YPpeYkIotn9
	FKPIr2PyvhLOtY1turOJOyc1r63YW0QlsLywnEpACygV6cR9tsuBnB6liqxp4fRmFlQXMotrxKH
	hvcZNxGd91z/yKVm2v+geFsq1NeE9cRsmhU6zpXlfcUOGTIoXOkJ55uTZyGVzItzAsi9dZkg2+Q
	==
X-Received: by 2002:a05:620a:4106:b0:915:79c8:ec94 with SMTP id af79cd13be357-9293d8b33f1mr194381685a.39.1782373894607;
        Thu, 25 Jun 2026 00:51:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:915:79c8:ec94 with SMTP id af79cd13be357-9293d8b33f1mr194378785a.39.1782373894204;
        Thu, 25 Jun 2026 00:51:34 -0700 (PDT)
Received: from [192.168.10.101] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d9csm14999506f8f.12.2026.06.25.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:51:33 -0700 (PDT)
Message-ID: <af39bf37-4ab4-44d9-b91b-b8fa1784783a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:51:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
 <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
 <ae0ec05e-607b-4022-a006-2eb1a283144d@oss.qualcomm.com>
 <d9582027-8555-49e2-9a36-c3b952dc61d4@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <d9582027-8555-49e2-9a36-c3b952dc61d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 944TG7KJxEpqK8G151db0W7vguMJHyIk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NiBTYWx0ZWRfX5sDCPgomjALN
 B8bcgqbDF36RZ7IyjXtsMXmUflN2w+8sbyQXreLnLyPSWlIXrO72ja+Sp1zdSHtkHi1q22ydWkl
 gg4KUHZ/FhjTa3ytz/1F+UuGx1WCvDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NiBTYWx0ZWRfXzG1u/Jkvwm46
 c9AcSsxjIB982EDijBNwivJ4aqlm6DPcrkW3FhsR05pmx/A+gx1hhhvnBcm49Ni/nHNhtlwqst9
 JHCExqTsQjWcgshuVq4HYRwP3+aoTGS48TcAopayPIrzEWx3XgOY1GOWjw5oBESI+BkFI0R3TtW
 XSwCabVvtgcADw6vHk44xBJ4FsBop2TnVpWOIQ0VnxwsJXw90I+RggAb77AcPeOsydpJwyYO3P4
 B4bO3Gr3HhSnh4eNjPiikoM5YefVk8FGOOGKeKu6E3E7GOFPpQt8u8OM8Oo1Bd8rholrtmr1AVd
 xYMS9Rbf6sIZQTJGaraIgLp356UQqpIzFMMYHkxaky65qIsv8XZg7dZPabSp6V803BKhhuhgER8
 H2av/k+WVBpR0vklkbOvGnrR83A7P8P9tWRYn/2OBtVJYZUmRQMQjB0EoKmSRoIurSZDvcRFgX9
 LvDAg5vStDl8qVM7tmg==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cde07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RTo7OxITtARzf4XpFQgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 944TG7KJxEpqK8G151db0W7vguMJHyIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114461-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E010C6C382D



Le 25/06/2026 à 08:48, Krzysztof Kozlowski a écrit :
> On 24/06/2026 17:56, Daniel Lezcano wrote:
>> On 6/24/26 12:42, Krzysztof Kozlowski wrote:
>>
>> [ ... ]
>>
>>> Therefore I still do not see the need of tmd-names. You know the name of
>>> cooling device, because you have strict one-to-one mapping.
>>
>>
>> There is one remote proc with one or multiple cooling devices attached.
>>
>> We describe those in the remoteproc node with the tmd-names.
>>
>> Anyway, we should be able to list the tmd names in the driver itself if
>> we ensure a consistency with the index by defining them in a shared
>> header eg. include/dt-bindings/firmware/qcom,cdsp.h
>>
>> #define HAMOA_TMD_CDSP_SW 0
>> #define HAMOA_TMD_CDSP_HW 1
>> #define HAMOA_TMD_CP0UV_RESTRICTION_COLD 2
>>
>> In the driver:
>>
>> struct tmd_name {
>> 	const char *name;
>> 	int id;
>> 	bool disabled;
>> };
>>
>> static struct tmd_name tmd_names[] = {
>> 	{ .name = "cdsp_sw", HAMOA_TMD_CDSP_SW },
>> 	{ .name = "cdsp_hw", HAMOA_TMD_CDSP_HW, .disabled = true },
>> 	{ .name = "cpuv_restriction_cold", HAMOA_TMD_CP0UV_RESTRICTION_COLD,
>> .disabled = true },
>> };
>>
>> ...
>> 	for (int i = 0; i < ARRAY_SIZE(tmd_names); i++) {
>>
>> 		if (tmd_names[i].disabled)
>> 			continue;
>> 		devm_cooling_of_device_register(rprocdev,
>> 			tmd_names[i].name, tmd_names[i].id, ...);
>> 	}
>>
>>
>> In the device tree:
>>
>> 	cooling-maps = <&rproc HAMOA_TMD_CDSP_SW min max>;
>>
>> I think that is somehow what Konrad and Dmitry were suggesting
>>
>> Does it sound better ?
> 
> Yes and I am surprised that it came now. So you had TMD index available
> thus the ID was defined. If device has unique and fixed ID, you should
> not have any more properties defining it, because that ID is enough. Any
> names could be only for users, e.g. label, but that is not the case here.
Yes indeed, having the constraint of cooling index and tmd(name, id) for 
the connection between the cooling device and the thermal zone was a bit 
confusing in our discussion.

Thanks for the review


