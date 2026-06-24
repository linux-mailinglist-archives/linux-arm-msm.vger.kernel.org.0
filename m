Return-Path: <linux-arm-msm+bounces-114270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxvxEohGO2qwVQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E76BAFC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U97jDDrb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eXOtMnVT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114270-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114270-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 873B73042582
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 02:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E4A3016F2;
	Wed, 24 Jun 2026 02:52:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF41E2857CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:52:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782269570; cv=none; b=nDLrRoPTlGCTpLZh9notyVr1sHKju0eTAjMRA2WHSLn+l+gS6vn3FFO5U9AlRO50EWpMpRRLjcqLOz+Db1Wl5UXSkGBINhxgl6jMypsa+p8Wol2z1dfVmLfnZhsl7o5NkB4E0iwqe3D0HZOJSFr+9RUqPBAZMTtkUotIyJsalXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782269570; c=relaxed/simple;
	bh=bBlGup/0k1wJPXjCKs7wZksgmVerSByXM9AQ54qmiF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXFXB1MiMfnltu2HxkMnvZ+al2Ra4j+uK3iNDbZ+Bl1qRuSn6UlBAmrL1aydHb+L/uaSf5K3AymTuGOar6iMPFJJxbayd1WRS27hNK7gQ0UYTrYSxbT/02QAcLI+z/TitrgUJyCrr8kQ0J9Ml7naNIh4kGavtsTK3erUoOJH5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U97jDDrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXOtMnVT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O2jaP3112942
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6/Ji7vHvoP6K3FS/Vd1DP3XU
	MbNO+toH83x0mMRoiYk=; b=U97jDDrbFjGSOyQKNKMgTYUROgj2BfbqtykyFqYd
	0KhDifNetDEH4Bmd2Hg9iwR5D4etqi6CahKAhHhKJwIX9XXzfhjdQqVfz0RzMBu/
	+BLrIMUs1hxWrifeBRusyS+guXIrEdnT+ybJ2z2Ird1mcm/9/IjEAZL/9OniSUuz
	Q/rdKlKUmaELw7qCSxefEXQDGOlWTTJ1CKTOYeepktirZgDTen8KCnlAhe7HeQS4
	8vnYw7T5RmQN8kbZJLu3keqPnKepnW1PBrIQYt19jn596r5h7VuUE+Y76MxnFjoV
	nQ1OMhi7C1Yhk1oEGo585JxlR0T6dA2XrMNRuR9z0CqELA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r300hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:52:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c5978b108so1394905eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 19:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782269567; x=1782874367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/Ji7vHvoP6K3FS/Vd1DP3XUMbNO+toH83x0mMRoiYk=;
        b=eXOtMnVTUhq+PUA2xdlkgClaCeWgUUNnkXZZXToPxKbA1ZDctvZf7J6vcKD26vuFZr
         vUe4nxfj9nF8S+zQ1WiVxtWfo5S/wQcz4/Hl7qs9B7XEI7GL50w1In94xA5e9xByzZqA
         /5rHdtI/+8+rMuu2kUqTON+yVH8Xm3YLljS1Nocppzbz3m8oUQ61ymlfcYfZOK4zSiKo
         b+7kozMnaykjntOD8rIlKD933NUbtDuW124m9t56yEuXqWTxrDdoE1rJLpAIcjGsLsvN
         W94iMGXFMFyz/Sy7fjkEisuXaxr43tSbYTZIoT1X/tsTe8J/m1CtGd0uuLmj92gTRxIS
         NA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782269567; x=1782874367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Ji7vHvoP6K3FS/Vd1DP3XUMbNO+toH83x0mMRoiYk=;
        b=l4cjcokwSl3nlVXDp6G0jdAX7lzi8p9uUXNMwWyNicGf2G+MqmSpGO1iv1D6A32oYs
         Qtu9cmY/NtbD/BKKPpj+waLjJSP5HBtVE1Ps70JmlHcmV+ZgH17KSc6TYsHIkUBgn8jK
         QTF04FOLt2ij9pV/eqioA/fCKIHYxKShfcQOU+a8V1rmYu4BqSSP3L5PSQnyG57RhOIq
         nwTMUB1PnIzVTMFldxSUdqXGPdpxj8INOrlWRUcfS1ulzEuzOOSJace40ClV5xDuB2Kk
         VbVWRX+AwVnTVwuOH/W+HMtbCsaujn+V1SNEKw1ztHu+mRRIWJQCSS/hn0p5/rId8MnA
         GnrA==
X-Forwarded-Encrypted: i=1; AHgh+Rox7GkfqO5mSkGEuAeeIMETn5uoTtdp9NqvuqakjI8spJtW7s10kV98rXLDdqhyXF0k6kl8tfviuItbzcF6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7k1VWqubCms72KmWlqib+AzJU8XdlxKjLMBfakY9WaFfS0Z6O
	Xk0ihGL7OC34WbZXEgcNMjDqATBxUIAF7sxr+W2IJ0gn/zHTPB7MjBylq3Q0WlEHGbDwfjaWb6j
	4Hrd9yIYPtlijJMk6QvS7opL16cuyP6ZBEpsIPcUooIrYaxYvJLzOeMC9z1J1QxO6H1IB
X-Gm-Gg: AfdE7cl8L55CnBJILhr048wHEw8P6pSLq9IW2h5sme6NtC7UUp85u8XP4rGMzqj17xP
	WMX0644CAHVGfVXq3J2xRRfEEqnvB/MwYq+tOrNvFSlLlBteqGb+1q5Je93nPUyGheQRWr4HBwK
	FjXZnhjk5gND9+ygbSj4gsizSlINidt5s6+DRsOq5AbH4nJa0mdsf5tVsuRqvBoO1FemlB0zwHv
	H/uMFj/uSm+Zou/WYXhExVByn434uUuvZ0yK/c0kKTqAdQ5zI1EJD97FLGhXqUJyjWKwJa2DGX+
	RLb12i7goe6Ej9Pky/OLccE0SHlbHH4XKaglI+dty+RBTTiUTAMJluUTEAN5JOGZE6eFNPDxA7z
	9AIYpENY5Bmuq5uWNuYFPbfXGWNWz34ehwuTpPz/7IMTjep+A2HfzrQ==
X-Received: by 2002:a05:7300:cb83:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c68c9eee8mr1693495eec.8.1782269567497;
        Tue, 23 Jun 2026 19:52:47 -0700 (PDT)
X-Received: by 2002:a05:7300:cb83:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c68c9eee8mr1693479eec.8.1782269566982;
        Tue, 23 Jun 2026 19:52:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6f4993a1sm185163eec.17.2026.06.23.19.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 19:52:46 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:52:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Message-ID: <ajtGd6OLJeK_67JS@QCOM-aGQu4IUr3Y>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyMSBTYWx0ZWRfX7rYS1bSt2yuS
 92HUmaoRJOUkm7eDJXVD9d3nzQh2QPJ61AjPZxQuL0Mo+DS+x2C22pcWs+DxqC0yKVRjBYJaFLR
 k3mNHlgf8d3m7n95tho6HHxGHRtinqyekEKJ5sX7j6WuNaDcKbDWnfchSGqTLnKOOujfl4jHmY2
 +mEX5tEVqiG3vL/2mbDiv0GH9iWMSE7IhPCrxm4TQ9DtJaqaCjuoHLDrzMC0xJUvSi693hs5mQY
 jPk4Yud961Zt4NU7oqZVW/BpCHgzwUb9hN6IBVFzK57A8IsmgP3xvtBbBDtrLkZWF/l0lYmOftj
 vEu7w++SywgmZmpyT1b7y/QkfS0wSSNQRkKlXxGMRA3Q6sT15oIwOgKSMBTgociiLDisP5vSwt0
 cRGLAGYd0N3wh+K5GtRiuxgZdhrvSE9UE5dknxgA3BXZyCQkgD3HNtOx2QBzf5NxGMi1dgKZe/7
 lvFdRqt2QOE5VlB+1+Q==
X-Proofpoint-ORIG-GUID: 1KEPC3HOoyTPaisplAZyJRkO32fRjOFo
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3b4680 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1IcVdnUytOkCmWWg2wsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 1KEPC3HOoyTPaisplAZyJRkO32fRjOFo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyMSBTYWx0ZWRfX8JJZrYuETAde
 peHv9YvU2sx1kiXoBcQrOrcsroEMfnp8L0pT23Quu1ua70TTspraTk1RgW+kOfWPiI1IVC74LbE
 G/8lSOUHY+HYGwhRbzAfIKbgj7IdBkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240021
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114270-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,QCOM-aGQu4IUr3Y:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 988E76BAFC1

On Tue, Jun 23, 2026 at 04:24:08PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPUCC2. Document the compatible strings for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
>  include/dt-bindings/clock/qcom,nord-gpucc.h        | 51 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..ba85692240e07a4ed8e69c6b61847c5601b32fa0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -18,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,glymur-gpucc.h
>      include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>      include/dt-bindings/clock/qcom,milos-gpucc.h
> +    include/dt-bindings/clock/qcom,nord-gpucc.h
>      include/dt-bindings/clock/qcom,sar2130p-gpucc.h
>      include/dt-bindings/clock/qcom,sm4450-gpucc.h
>      include/dt-bindings/clock/qcom,sm8450-gpucc.h
> @@ -33,6 +34,8 @@ properties:
>        - qcom,glymur-gpucc
>        - qcom,kaanapali-gpucc
>        - qcom,milos-gpucc
> +      - qcom,nord-gpu2cc
> +      - qcom,nord-gpucc

I see inconsistency in naming between dispcc0/dispcc1 and gpucc/gpu2cc.

Shawn

