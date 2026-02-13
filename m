Return-Path: <linux-arm-msm+bounces-92746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ8aD2vTjmnJFAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:31:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A509F133936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7906F3030EED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3814B2F28FF;
	Fri, 13 Feb 2026 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCsJ40mg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vfhn00cW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B32EDD6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967912; cv=none; b=sV5ua9MV36GKpp8uf81TxfVTeZDoK7fHUDmKUohP6MiiqgUzRzcTlWGei6czDKh7Lh0J+GkyFYEZogSGoHgNGihZIBiaGOBzicRq1+EfA0V4RozdWqa+rZw/Jov5LB7oblviqbxeETvzjOchBVutGlvu4yt38rXXZ4VA3ekENG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967912; c=relaxed/simple;
	bh=Ee1Nf/av7WA7+/1fwJdgqUPEf25bQzrdCmpSHIu/KX4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zkc2S4tf5kW/vIXEsb5tvZkq3quJOdPiCMRJNl5xRFOKZWw3CgDgmb8ZbyLHOr5JLEK37TuBLwvQxFqnyGNryb+ZRrForqWLV2lUTZkc63eYBucaRSbkIUYCPX4u/edv+7flMf/NQuRhbwUP+caEHw9YUfZaZmQf5C1EfZscQvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCsJ40mg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vfhn00cW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7NDx32629555
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YWiNt3lTljwCyJwn+r2SC+
	u1cEIq6wj3aixcORgCte0=; b=eCsJ40mglDc9KcSYtFEF8DYVibCDH2dxj8pseH
	XnwS6x9pJkXvTIEzNzGAf+wQoC8KXnTl+Bx6f4GLsi3tvcCZ3IdDdeOPTAqTKhPG
	Kr+nP9MA3wu016S3/KFopK9zR18sVCRqPwatiDSpHJ0g3nXFSTijeUyejVKOr8wu
	O5p1ye9huy+5kwf6fHCSnkQ6NuVujdfX1sZ4+PS335DiAUbYOxCfG8e5PJetaXuk
	zG8rYZ43OWo14mNJ2iLBpyZcXg2qszv/ChJn5anNNgCbLwyUz8NG1Hg+MiZNIXIs
	Vs0ka3xz68S4zCCpywuho0YmPL3sZbaQvpVP14G3O/Ag2BTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygur0vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954adc2173so60458116d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 23:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770967909; x=1771572709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWiNt3lTljwCyJwn+r2SC+u1cEIq6wj3aixcORgCte0=;
        b=Vfhn00cWv7CnoUaQMwXQYTJGAPZZLRkQdJWNFdD0SE7JdTDG+nRhkWTFg8Jq1klRSb
         CydRSaHAxti4nV70vouV02ubEkNaFuVLXrqSc+7beliSowuWdndIxY+lf84uhGo0lYLC
         GBCGhkKUuFP0UA/ON+oq23N7A9cniR1kKbEe2OBT8hA9xaAFyNs0ch37hG8+ZZHIqWnD
         bo6DuLQVruGSVYPQmHj7ZfmRPIzJ+G5BdUEGJhBRGHQO26LtxoUaFkXzhfFScWNkeT57
         UCmimEhzNEvWNHsw2llcaCM/gUvbNOBXRUIBTi9istmccovDZ+ZIMELpiVzmbxhRWl7V
         ZVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967909; x=1771572709;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWiNt3lTljwCyJwn+r2SC+u1cEIq6wj3aixcORgCte0=;
        b=SkjGr49DHSBmZ0PJyzP+lCw/C7PvMTUXJgr6eYkXuiFQA/g9hL0DA8pG6ap+b/j0Er
         V0OHhqEHjbbN1/BPJLFf8duBF1lm1nIReQJ26QNRCq9iHwukbrXxXbKbqhNP8q0rmtcG
         ykGOsgQKTPUPehfh+VLjXGbRLal1sMLz7v6QYOMocWSGFucWCW2gResJsznF2oRaXg39
         zENlqoSvhimZifadDwFQY2ZW4Ulyrr/niSU9C4/W+Zy4YmxbQPH8otk564rAV55zbXLc
         5YfiV6IVScLrxmLvLck7fCsQS62PHfmlPKohPLTCE3VEHiJ+ZWZTxo06SsxFCsMw35zT
         Bn5A==
X-Gm-Message-State: AOJu0Yzm3wKRTfVdq7Hyivf+uOaAzuDyvamkCLOojvIBWnt1KO+lgOjh
	YtqTHnFEvGvqF+71NEYYpSdDtJsh0sTUfq8qjzHxO2da8sKu4hzvwd9jlYdtCXI+YlXpWY1MLXs
	UMy2yBQF0dkkuNyxKXMt7GblIbUo6dsu6Rh6OlNE0cytwr/9LJ4pDNBjc7WcT98kPI+Dd
X-Gm-Gg: AZuq6aKsBd2mzO0I3c3JrzEadasJQxtXhft6EYgosj5Ol70Ej2ZivQPXtfFkLDPZjUN
	Y3k1K7NnWYiCpJauvfPwjZBIY3NX+hLtXLrdEiGQJjCt7Y3J/cIl8VGPlzSrkEhSOO6VLjdscna
	cGG7cxjkLQ0f1eyo6Q/oxSEzlyp+gY8OBiUwlSR51C5fEeiteLjTPPr/poua3V6IZOvo1K/gBXU
	RkeVHy4M56ZgOpBJa7zfyDGdsOYvd6QT6Kwrf25YcCY64/YIdrg0glStYfJhmwW6rSd3dtZWzez
	izU3hGGsDnxc5d6/rpSsPJUnev3EBj5Q4uZQm9CbYVC4qtgb00ccTyisks2uVhwWDTI6rNSzdsp
	jDH/2dwToi3FUc5NZN0n4scF6qA7gFcKwM5184XC9VJVHJ2LAoxbkCz9n2r6bNpFV9KjrE6Dcid
	i26Qy6M7Y=
X-Received: by 2002:a05:6214:c28:b0:895:4852:ef4c with SMTP id 6a1803df08f44-897360d0142mr13356626d6.23.1770967909105;
        Thu, 12 Feb 2026 23:31:49 -0800 (PST)
X-Received: by 2002:a05:6214:c28:b0:895:4852:ef4c with SMTP id 6a1803df08f44-897360d0142mr13356346d6.23.1770967908679;
        Thu, 12 Feb 2026 23:31:48 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bda6fsm541156485a.9.2026.02.12.23.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:31:48 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 0/2] phy: qcom: edp: Add DP/eDP switch for phys
Date: Fri, 13 Feb 2026 15:31:41 +0800
Message-Id: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3TjmkC/2WOQQrCMBBFr1JmbWSSNNW68h5SJJ1MbEBtTWqxS
 O9urEs3H95nePPfkDgGTnAo3hB5Cin09wxqUwB19n5hEVxmUKgqVGgEu+E8dLOQTFazw11JCPl
 6iOzDazWdmh9HfjyzcPyV0NrEgvrbLYyHwlPJtaRK14TW19pVmrQzLSFzaYw0zu0Mlha+ri6ks
 Y/zOnKSq+xvzyQFCqXlfq/a1msvj31K28fTXr8vtzmgWZblAz44qj7xAAAA
X-Change-ID: 20260205-edp_phy-1eca3ed074c0
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770967906; l=1469;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Ee1Nf/av7WA7+/1fwJdgqUPEf25bQzrdCmpSHIu/KX4=;
 b=Q4lMX6lMSQWQ96OG/ex284RSApliZ1e6b4i6Q+6+OsMsZ+TFmkj0JPXzDHTwwl5rKIo8Ixlzs
 K8nx8mIlsdvBJ2Vu351GG5xeHboHkQLfqEdll1hNwUNefatXjWJq8k2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 1MTzPn8hbKdnVIxlYMKIdHeHO5fOAF6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA1NyBTYWx0ZWRfX/Qrzqg4CWn74
 880/sbE8wVlkN2VhsUd1ZVMsZb2au2qyQ8sFH93kVLXurzSvqMxaOkf1HfsPlIru4jB0lZjXJwo
 AVvGNlBKSwFUo3giI6WXm73vDKUgTaQ7/ZFg+tfIPDD5E+c/aVKUk7hQKIli3JJVUERNHeheYyh
 M61LZp3aULPhYf/HC7T1qBFz6KKf4ySaz9PUb30K89kvCZToGpG5Sw5GKNbpFgd6tJ8F9JHoEyu
 lunTcB0g+P86aw4CGZTQ604aIdOIKf9pCTmOcwuv1juMJbmxxymatsblEFJdAIqX9CWS90Gqtm6
 44Tj+y8ZafF88cKZQvv8zRV+UZzfs/gmtuImsfl4voO2aMJscW4sjj0JT9/x3aLAsSUKdPhWrJM
 yKHhIi4vL645fLGlfURofK3AqSGJbd5yZjKFGsdWgVssGi+fFBBvIGMmQYjR7Fc+oLsmM4D53Z5
 Qk59p2IGaEjGbO2NF8g==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698ed365 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M-2OMZX0rM6BGFiE4MwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1MTzPn8hbKdnVIxlYMKIdHeHO5fOAF6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92746-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A509F133936
X-Rspamd-Action: no action

Currently the PHY selects the DP/eDP configuration tables in a fixed way,
choosing the table when enable. This driver has known issues:
1. The selected table does not match the actual platform mode.
2. It cannot support both modes at the same time.

As discussed here[1], this series:
1. Cleans up duplicated and incorrect tables based on the HPG.
2. Fixes the LDO programming error in eDP mode.
3. Adds DP/eDP mode switching support.

Note: x1e80100/sa8775p/sc7280 have been tested, while glymur/sc8280xp
have not been tested.

[1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v2:
- Combine the third patch with the first one.[Dmitry]
- Fix code formatting issues.[Konrad][Dmitry]
- Update the commit message description.[Dmitry][Konrad]
- Fix kodiak swing/pre_emp table values.[Konrad]
- Link to v1: https://lore.kernel.org/r/20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com

---
Yongxing Mou (2):
      phy: qcom: edp: Add eDP/DP mode switch support
      phy: qcom: edp: Add per-version LDO configuration callback

 drivers/phy/qualcomm/phy-qcom-edp.c | 176 ++++++++++++++++++++++++++----------
 1 file changed, 129 insertions(+), 47 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260205-edp_phy-1eca3ed074c0

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


