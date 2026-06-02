Return-Path: <linux-arm-msm+bounces-110836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mjNJK9oLH2qZeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:59:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390B630705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:59:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AhYt0PXk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=koAG2HwS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624AD30A737E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 16:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23634385D67;
	Tue,  2 Jun 2026 16:51:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4838425D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 16:51:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419106; cv=none; b=kMcR4ytYrZyjuXX9BNDHzXsukKo44BHKGYZbYtMVCVB6mbQp95TdRe6Cj3WyG7k3uQvoqZUUEdXgSKtmxuca3PeUfJLGFjYhkoKtd7OWOXOkSp+04GUffgDqyk+oD6811zaM+B9LgdtkIJsj1SFQaSR4a/qBup83NL4XgfKzM84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419106; c=relaxed/simple;
	bh=2eDfwlwqlE3AF4FGiwEuqZdX2a2njMaGvqF4okZGNx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AQ0YBxakoa1PHvsuaXAYPlCVeOCmNTEA8f1SCc21Xg+IDDrvQIsH3C95Uk+QLpgjHTU7+lhj7pUNyzicn4djVyaMbAAeNxnoRYPgIplWg7+czPuLTlfvfP5S7Qe1DmaoEIQyddGqZsZc+wXaCuWTuVYzuBWwkTo8pa0wkS8jKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhYt0PXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koAG2HwS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652D10fr2884654
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 16:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zWMfIkSCmqLbIKAOmeZqRZ
	ynPj3VmhvNRt3uohhm258=; b=AhYt0PXk+qbw1RNo8pOeYZhNdBsamvZgTbaeUn
	6n6HxOlqifXDvll8Xg0HT+agf1vUD9bSlv4CevN38d/SoaaeA7bz3UZeATZCVf38
	FCeomDGeKjcranof/p/ba2CKemoiz6LOwibbe0qzbWzjqgvGYoxoZQ8m/Alh2sue
	j/I3x67DO4yjxbkGSD+VQ+SGmp3WXnInQg3mhJnjJPalPWAAWluMkhIjQZ3x0Ccs
	YEicmTOW53Owa7wctZuZRtoe7Wv53siUufxImtjEfeZ3dM3NVbg+B9+yPqImk9SH
	Slw5BJWhh+LVsMojtM4tZH0CjSx+hUe8OV9rje6/c5CfI7iA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu12jcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 16:51:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ed777a96so2584368eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780419103; x=1781023903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWMfIkSCmqLbIKAOmeZqRZynPj3VmhvNRt3uohhm258=;
        b=koAG2HwSC8+X4Lruf8EPFUbDtUL7kYhLwIbqb7qFQqxvO5pForiyyoRUXIsPLh8z/m
         keCwCe7dFmSfEFuBHgJWOosCHKrqRIOiuXVT5AJMdSiKzKkV/pQrETFwYWV2N4UfLQbW
         GR2zr7H6vrDjbQxzyoZ16B6AvW/Y4FdD1Ms7dXvbL1T99CGj+cj+aV4dnsO3odKASxk6
         pzZmv1CCYr8m2jCi97+17fGR0JxS0f0jmmMX8x00YZwHlMaoeNVK5TXGYuoql9/OCho/
         UbFEERK0kn3PwIXq+sT81Hsa5dOJkpafpyYDmiQGGWK+QSfJF0dlb1DyfXsaGCMNYu7i
         9LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419103; x=1781023903;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWMfIkSCmqLbIKAOmeZqRZynPj3VmhvNRt3uohhm258=;
        b=h9NkPjtJFS+8n5TeB4G8aGhwviUvB6UVt+BmDhzH9T1jxZqVi0joXdl4OgY01M8jr1
         AH+r2K9f36m4WRSs8VNz6h1FxBeBN11N49xaXWP9Y1GduPapG44aTR4IqbH/ENwbnFNS
         sdhnZL3ZurEjbJjeJWKig9ZWwtXoac2sqla8whQ00CeQCXQtdsw8xF4Nve/0kswVaTr5
         5eLLVU1d1R+AgychT4CUomw4ywKGeIKGqjGSgpZ01AdGFtQGSPf4ebWd9O6vWSkmhynC
         EPI157KyGBqteMB1dyKRU8mMyefhGJYSweqpGe+THe0+g0A1Wbe9/I6dJXZJ7kDjFCuY
         b+TA==
X-Forwarded-Encrypted: i=1; AFNElJ8LStWOoqpnIVYDSOK4chMdZTdJqvlcTt5VpCYLB86HZHVftstq6bNfURNNl/aJ6A9VWZCGEvuVkoezL+qh@vger.kernel.org
X-Gm-Message-State: AOJu0YxSJCBZlTL9qxr234ZweEbleUgqCexjKlBQ+Gpkj9bZyiyLwgiV
	XAqoIMe6AKZ2g9AzrTfIcrIkgFIAzwGfgyrYInZplmjFvYV8Yyfr1lbdjHniDVxE7UycOVTmWu/
	xNDyan/W3GZFfN+jqRDK8QpHBVG+5BeI+2RoHKMLP32KCwm5spUem19sZXwusPJtCJRWpT2E0I9
	+BjOE=
X-Gm-Gg: Acq92OG17AJrkRV5K2AfJDKVf1ktu/ANBdNW2NIxjLKgYsiRWA+G+ORpfnpViX3ArPY
	iw7cvqOparQKdYUCtydtu6LBnZcL/1u6XgX6wsZfe3BQFNbpgA2z0kL2rKK2jtmlWBKI3/IacNw
	6kTq/+o7D7KfVWGoRUPfU2X3fNcSvGhHHCsh17i97MWO2zCEi6jTme4aSJ2vMIFEsTaJqGkNDVA
	Qezrd+jsUoGS1GsY2nQ4WBSL6Px2ldMwWIdk6wR5FR50eZ20tEC6flUIWh5UtSE33ic+oaEp2We
	XjFnS6sHpe+RK1AafGjv6LyuLHNsKCNOfp1w9FSxXoSnR+GXcXACiotJ9w/GMuOkjKBuPxcGFKg
	aChKVBuX2MSgGwpU2gUEKFwkmP7SX4LD73lWyGAUfkVlsxaWhtLEM2C7wzgKvc+6vo3hPhYs9h4
	+fxL4iMUjQWQMPsqdUv8k6
X-Received: by 2002:a05:693c:2294:b0:304:81b6:fd51 with SMTP id 5a478bee46e88-30734a8b867mr2454095eec.6.1780419102759;
        Tue, 02 Jun 2026 09:51:42 -0700 (PDT)
X-Received: by 2002:a05:693c:2294:b0:304:81b6:fd51 with SMTP id 5a478bee46e88-30734a8b867mr2454062eec.6.1780419102218;
        Tue, 02 Jun 2026 09:51:42 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm12109172eec.17.2026.06.02.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:51:41 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:51:35 -0700
Subject: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABYKH2oC/x2NQQqDMBAAvyJ77kISaYR+pfTQxo0uNbrdxaKIf
 2/ocQ4zc4CRMhncmgOUvmy8zBX8pYE0PueBkPvKEFyILrqAw7SXVTHzhqu9sAh+isi4Y5qW9EY
 TSpyZFGN/pdj57LuWoOZEqUr/1f1xnj8rW1wNegAAAA==
X-Change-ID: 20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-6d5e671f173e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419101; l=1585;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=2eDfwlwqlE3AF4FGiwEuqZdX2a2njMaGvqF4okZGNx4=;
 b=lujxzYi/r9wqWnOn/FLJjGBzLiwozzZeBo82HyOc2wvfOENrKbg05C/j/zX7+/Pa1cGlVMauQ
 PViNr1cdeNdDWAs9KQ/mqN7mDVuMwnRu9Pks55gs79HEvqGREZ/hm2l
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: jMR1YhnWNjaTigXCinMGep1gUu7VOBto
X-Proofpoint-GUID: jMR1YhnWNjaTigXCinMGep1gUu7VOBto
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1f0a1f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=whlQpUbcimcIkjChax8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MiBTYWx0ZWRfX1VC/H0ttOmmJ
 BL/98TvHTVkn9WC5y2lwwPyNRXdgKQCJfDpm4O0N4w9G1SAUghmlQwlvfiGVwH2aMbZeZ8G0Tdf
 gf2nP4LIzfCr8gTHrsHkAAzMBRrVhLFD02WH6gEWGcRhaOXlsmA9WOp4WaVf2VV1l4FOr4S6ZwE
 ZxW+sZFVFMCVUoIz5gSD/IcbqB99RCgSHgG2IVT6d6nsG96Tfn6i77Ku0Gyok/0cg9Dd1K5XG25
 +jIks7CVnNOIOa98TUcmyS/0dE7w1JBXmPhRLfpPw9lo32U2iow77iuWxg3GQgGby5kmv5MEbmG
 SSSTk2NArfooT+vLhD34O50A82bjTgtXD8LaDZwFrKeqVlfbVitmQ9xy/DmoB02RjdUZ5DE0UIw
 UXCxpkAVVCKZB21BXF3Vek2Wg3eZfz66OzoHQcYAO8r+cPIcbB6yFPyUdMGlE8jIoDebU/jx0HA
 kNOg0Q8zN8jD07IjCig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110836-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wesley.cheng@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gopikrishna.garmidi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0390B630705

usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.

This fixes the following dtbs_check warning:
clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
is too long
from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml

Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..fd503e10e409 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -786,8 +786,8 @@ gcc: clock-controller@100000 {
 				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
-				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
-				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
+				 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
 				 <0>,				/* USB4 PHY 0 pcie pipe */
 				 <0>,				/* USB4 PHY 0 Max pipe */
 				 <0>,				/* USB4 PHY 1 pcie pipe */

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-6d5e671f173e

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


