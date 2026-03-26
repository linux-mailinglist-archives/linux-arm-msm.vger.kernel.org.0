Return-Path: <linux-arm-msm+bounces-100028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qQA/ONW+xGnN3AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:06:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CB32F3AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 088E130467E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6959534C9AF;
	Thu, 26 Mar 2026 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPDdWEY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b11Ji2SL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4904234B1A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501454; cv=none; b=bYdrOd0HTjckmpbynq6fM+ycIFQa3NOjAjEmbAnJTWM4BjecKnZMJA3W/GEmKwdRCI1QPfOQFliLUx3g/7+cimfkaLbm/hFrPG54sxyLdODAZLNkCUlrDq/H6ECdgpM3CJt0G6aS9ORP8Z1xqwb0Q7OTJQEOs78i6IHEB5Uuo10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501454; c=relaxed/simple;
	bh=+cgC8o6objMlkRYtUNMyJwtnnyGqaZktPOsybP4qn4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezB/LiQsZoLrnxsXZ+7AbSHv1Pw8wpy134phQRTsnt/Dh7WwK1Ha5Ai+aKLIyJHq0FpRVeozLNVaG0dNmHp+Ab20QA+Fl78BguKhYHj1W9yMPtSvHnInsSk7irBpKe8NMsq0NP+KOIPABOZDktXji+JBKnj7+Dkr9OBDCYM3i+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPDdWEY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b11Ji2SL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PNFqdk1554510
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpZ0T/5n/sg40gwyNclxxw/d4xlHDB3hOtWU/1HM1bo=; b=cPDdWEY18SIimcmh
	0ECvk36yiBEp1Q9JGjk4Ho/zBw2DZoXSf25bJ2G81hgXrK1o1xtWMiNvzhe8Sr/n
	rdAN/yzRW0jYgHcAtocszJlvbPs+vxGJpfOydLtAXpgG+g5IIDse3wXszgvFKbZK
	gTluDoq9Me1yngcSjKFY+2+cHiTVlWuu1D0jR7ZrZ9AsRddKvg7sLBSNYrF7l3rI
	A0Onr70DAmPdRXbuz2Hm93N4LSJ1ncGEqgdti1J1fnunWj/P7VtpJCY5yXtwaRt2
	ZnV3z5wvMejFryXOii/SOMNL363pBSrcWJ/om+hq/+VFrJZLJT8OqC84zjW693du
	p2sLsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7awq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 05:04:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so895927a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501452; x=1775106252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpZ0T/5n/sg40gwyNclxxw/d4xlHDB3hOtWU/1HM1bo=;
        b=b11Ji2SL86x5pDjdumxaty+dXdsg4lczsa7SfPK9Yaoiv5N+wf2EaoYgxLKvkN1xkC
         BddmoN7Vd0ABWSaMBKthusueuYhyhi8y/LIHzbdxU7WtjVnYMjd6nt4ECS07JAIQeb/2
         HgOxmPnWt0nIUwdjVjnZmGCF4yMWlcoxARf1Tntflds7gicIW0i3oY91CbY8rXfuFT78
         wLohnz8+6vGyVAvmYNLF+2E+OHo5rzpwdu0+agBGD4vxdCzon45Rlvhd4RYV4aQPWfyW
         Byl7ebogXJLcKoZs+HBC4uTybaJq1Xcp4v1GVUW+1jdgqAGFrDM/3tcMOv3UUkWLqxBl
         u3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501452; x=1775106252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpZ0T/5n/sg40gwyNclxxw/d4xlHDB3hOtWU/1HM1bo=;
        b=o4At8oGGxtKvz9iw3y5h2HdEKSZgltZ301ogtoMSR7djRnAa7aaxRGnDJvLyEWV/kf
         YjwFvAN856yjYd1hNYC9t0aD6HY5Qyr9r2uDH/K7x1wcXNNkjiTYOUezM7KT3qmBvnYk
         tHp03DItnhaX6i/sVI989DFGA78MgAtgAKtt83gfSckYW7RoxY3GvwjzsT8WE6oUBSIG
         0mgKuy8BIfu+U8Mi4juYC9rGd7ZvKg5C+trb2Fu8QMznRTaDyACankYWg0Fy4Kx/03L7
         xoNqwp90UQ5Mz8wd7GdU6aVNTyjQ3w7fH4WOujNcC3d18XP2KapPaI+uoRIl+ZIYMD5e
         tlfQ==
X-Gm-Message-State: AOJu0YyLdZefgyEtQFo5RN6Zp62Ftk2aGbjHBsCer0YI1TtqA8C4Fqx9
	B9H66AY3fsff7y+zfmtBkH4PcP5YwR6tAmni7CyzyEBHeCVk59xkFJY7gBYUDjmTqdn7qCuC1fV
	Nb4pu86WkrHwelPMBGXAOyRboNhMDHHo/dtosFJLjJ0cEzWIl1mOJUVZWAkghBWUUxv6P
X-Gm-Gg: ATEYQzwiLWM/Bpa8AGYgVP6BHC8riHzAEC8g0+V6oEw9cqnJxgJ4Kmj6YvT8+6fiPWF
	GLgvl0uBGfF9nGUkimMB93rur+f7wDAjJrw/jXK3JNoJD1YxQcl5CEdpALo/W8DrrZwHcSb/gPs
	c3sLSsGiE+yndGojFUqVZKmq7aP3AGUPmEtHiT6D54RqfIDraBenQCam8xMKie3/Fd2yGAV8iLm
	2lddhMV38wILjbujvNaIQve0XTuJtSeMPbGMe+jNknK9ZI1GR4tkmL36/zx+YmzoStfhute4qDU
	OixUkV0DcRfXfti/4DwRZKJCv8JGWdDmspbTR9P2C7UhrlaMAVJvjwx1nTHLgnLaq+31XCawyxu
	3y2YP07AS0QQkM+LnZIfOR4SntSZ/6boWVwJkrx7+Ri0T4KoHWdao
X-Received: by 2002:a17:90b:544e:b0:359:9016:1e72 with SMTP id 98e67ed59e1d1-35c0dd6b831mr5486703a91.19.1774501451677;
        Wed, 25 Mar 2026 22:04:11 -0700 (PDT)
X-Received: by 2002:a17:90b:544e:b0:359:9016:1e72 with SMTP id 98e67ed59e1d1-35c0dd6b831mr5486667a91.19.1774501451083;
        Wed, 25 Mar 2026 22:04:11 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22b9fc96sm186754a91.7.2026.03.25.22.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:04:10 -0700 (PDT)
Message-ID: <036c8c0e-350a-41bc-b56c-a9f4ab6a156f@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:34:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4be4c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dMwID-rZ86g1OZKhrE4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNiBTYWx0ZWRfX78pGfsvim4lC
 +AAAPizAg1wLit1NL5OErqJxs+D/1E22i0fMVWQ0TK7Gn/0Y7KMoUz16GfJDk/zOOk8nEDJKWBk
 L0qby3MVyV6Yug0Yacq68tLpYkb8Kv5HpNYsMagJj00uLuaobcNHP75TnZ4tjsMYP6S2r2D1hbB
 h4OaAPsNG10p95adZlU9HLucLkg6j2bf7i+IdxlQSQjzixhwV8qYjTENY5aZfd8l4K1tYF3d+E7
 8mnp3m7hvgTCTxMQndDKL+VKs8WIYoDrHqYriPv/iHV6NYlceLcqiRcRJxu52I4L15qy/os9My9
 pRAVdNPyrd5aKTOLPFilzrbPtC+H43ySbHQMI93VPFzlV3ivmrZBhvujHth9vjGPVy+xUBxxEdK
 2qqNLln01LZpwn1JDhUruTQlh8g8lNz585Sgfx3essjhpKR2oOco0C3eByx+EK+fbTzpYb8+s+P
 VpupyLF7omTs3MqXCww==
X-Proofpoint-GUID: 7aPhOcIIwcyqtumxLTSfpGINHMqczA_0
X-Proofpoint-ORIG-GUID: 7aPhOcIIwcyqtumxLTSfpGINHMqczA_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260036
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-100028-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F6CB32F3AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/2026 5:09 PM, Kathiravan Thirumoorthy wrote:
> Document the scm compatible for ipq9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index f628b1d70fa1..7918d31f58b4 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -34,6 +34,7 @@ properties:
>            - qcom,scm-ipq806x
>            - qcom,scm-ipq8074
>            - qcom,scm-ipq9574
> +          - qcom,scm-ipq9650

Where is consumer of this compatible?
If base DT isn't raised, can you raise along with change?

-- 
Regards
Kuldeep


