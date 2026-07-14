Return-Path: <linux-arm-msm+bounces-119093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IHPnFHKIVmq88QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 21:05:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41075815E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 21:05:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RiqmIo3R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WGv+TV4g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119093-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119093-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D230301983D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8CD3DB992;
	Tue, 14 Jul 2026 19:01:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9453546EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:00:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055660; cv=none; b=hrS4rYKfQOHGu5KqQIUh5ca0zwU/W0Kx305JWq/FLTW7XDhuDUSZEroB/ogBCQxEmKclPnLfNDH5fq14SgyJnNiPbie5NzZ9Uad/MCRGcK3n0D0+22UIE+gCAhTr5vR9IUbk1odqiRMmJSbEAFFCHx5EZwln5rYfKqxFROtsF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055660; c=relaxed/simple;
	bh=X3Lba3dgXEzPAjsK6CyH0r+pNDAwez8GTdDZNaOF1sc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a9NbURCEK48floQTk/Q+tmoUuaw8WzZDdzh9PPAP7mgHzNpsENmZoX+vSmjp1TJc96UhzDQiJckqby+P7DM29moOLCIDnnosTruccEIYDAjdVPoHekEXm4Cad4v+1FzWbBYAfaDB3V+qe3ixLWtu3byfGc+aLma3XYaY0qooKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiqmIo3R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGv+TV4g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwYjY1415331
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4x5vqmndG2MVx3ZPSVcCs9
	Oi9z7BzSXuzgECQByY5CM=; b=RiqmIo3RvzmLP2HVu7MSiOb1jxlsOtCPtoP0DH
	LvYKlrNDWMHDFVNtHH+ulTCEqO8l+yEJVPR0YNba6U5v+lYSyCgq7fbNZT4DICCB
	ACVzhMfyXNOVFaJgaOD+rd7ErOeS1sNlCC+YyRvwATdQe6Lsn2d6YwyEtb9+hxG9
	/ciMNTdmUsi4VH55mnYoFogvZsP0SWDZGbkEXEQiAcJ3eoDrdRj/4h2Iu5CfGfka
	1L2NvSIqzdnzfe7PEaSE5yJuB7259CauI3NiE0Uvd7IMabai84glIjd1y/zrd73t
	1ZPuqW9m+fC2TOYJMqMybYBlrdmizflwNI34zuw9etUwTrBw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9krcjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:00:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ddc70b9d5so859871a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784055630; x=1784660430; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4x5vqmndG2MVx3ZPSVcCs9Oi9z7BzSXuzgECQByY5CM=;
        b=WGv+TV4gd1skM6j4BghdlLngppyUoYUkymAMuZHtO1yauft7ytfX1ZPdfN0qt1i5LR
         uK98sJlaKfVZa/Y8INTLyBy6iEDDuTFheDzNUzS1jb6oP8XfsCbJbq7+7FE4zYLEMcbf
         zp8u2z0Q9eTtecEeIlfj98bd4oasAgz5qRmwfnVFF222M89E2WMexUgjdFlm9zMYGUVj
         yUSkIpNwCLSU5/hkNj17l8dYWdlX3tzgtwz2kmo3boGLQu1gafqFf0CiCptWP0BB61pD
         roS0GPpLAceoOTOYRhr55RzStZWHXVE6VG7tlQIKU+i8DZb4V8+TtI/edbfHx/EjJIJs
         RaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055630; x=1784660430;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4x5vqmndG2MVx3ZPSVcCs9Oi9z7BzSXuzgECQByY5CM=;
        b=iiHr8GceG3oCvdNS1AIxdkn8gvr1wnRN1zyVHVY5Z36EtVkd+zCCga2s/ijK5FVO7H
         EzrEroGpeYE0noJ2N/mJFqLjl6ryCfpWSdwjmT2drIkJ6X6FCHfne+y3/cXnpNzJLC05
         GYUjNtadR8DStJPbwypgXKNrQP3FPW5EdGWrSVEVg+Z8Bt2HyeV9WNexItVzN+R7YoXw
         IQ6UFEN2RmhBp9XWO2pivk2oREEmvYogdWpnrp93SoQrbez7l0W11hIiYAZ4zZ8OYE78
         1kQ1j+eN1q1XiDctGsjuljVR+rUzzvqC1OI8jpStj1Nbv7xYIUT4ZJroCI5gugG5vPuF
         2jog==
X-Forwarded-Encrypted: i=1; AHgh+Rown6Sad7ykiGIXqN9n3d4DW+fFM9IDW21JINJAaGONmbAe3nP3lXGQKgGrZYqKFBzXJahrmx+d3aCfPIrx@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGxrN/Zk1QMZowBOMg06MwOQWf82EHOtPMJNVTT1Kh5Uv3COQ
	ry033IWpm/wyz7f2FSAlLgrByFI/eCZYTK0CT1SCUbC39EoJkByfc2/Z0cosd2hJbkMWr3vKrzL
	EAZ7PokOmKIwgWLR38sdmv/PN5TWoG8J2xjpdysCOfhp8yWr0CidU148siQlnZW/EAepR
X-Gm-Gg: AfdE7cmuNN5LmlmUiGlbVQinOwz8AbOl8N6lGz5XL9d/PEb2K4sTor98WR6YWsYLv7+
	kGISdMWqiqwvgbBd7IHUFz/9iXw66mZP5jsq8R9EFelB2jWXZU/nG3lenuOtfMNRlh66gRkbijb
	lsl7/JRkUR9/rOOEIWl1Jmohf45xFG6PCQBeCNIQe9581R/+dhcvdRat68jZnoTWpIDT/8d4TQy
	nL4i/FiA8aA4y/qRmSw7t+o9kPGqgJ71z1XTLLAXddfhUY7fe32Cr6rKpigcSwhiN1ICqkP6KAC
	5o4fifauKHGcmZAMnba1+wmVFamdb+hBMTOkcG7DAhmu9UiSWguAZgtVnEAGD3GG3PhHQwzidKq
	+IwJ/SM+o7663jl95FGcvX4KXHWW73TYH/8yYcAjpg+PdpF81lNZviXH7OJUP8gWNGEJ12JM=
X-Received: by 2002:a17:90b:57ef:b0:37f:f00b:bda6 with SMTP id 98e67ed59e1d1-38dc732cf3fmr10354954a91.0.1784055630169;
        Tue, 14 Jul 2026 12:00:30 -0700 (PDT)
X-Received: by 2002:a17:90b:57ef:b0:37f:f00b:bda6 with SMTP id 98e67ed59e1d1-38dc732cf3fmr10354926a91.0.1784055629589;
        Tue, 14 Jul 2026 12:00:29 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm56634528eec.12.2026.07.14.12.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:00:29 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Implement Region of Interest(ROI) support
Date: Tue, 14 Jul 2026 12:00:24 -0700
Message-Id: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiHVmoC/3WMwQrCMBAFf6Xs2ZS0iWnx5H9IKTHd2IU20USDU
 vLvxt69PJgHMxtEDIQRTtUGARNF8q5Ae6jAzNrdkNFUGFreKq4axdCZMXga0enrgkxOoj8a2fV
 CIxTpHtDSew9ehsIzxacPn72fmt/7N5UaxplFa4zETlkhzj7G+vHSi/HrWpeBIef8BUaccMCzA
 AAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055628; l=4742;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=X3Lba3dgXEzPAjsK6CyH0r+pNDAwez8GTdDZNaOF1sc=;
 b=qOpdtAZRhR44YTmyWQL04SGbNaauL5OeWyAw5B7O1jt3QShFqYpeqyR+v2ShVo2UCvA9tSBjR
 ppExLiTeNT1AY5voWW5AMUFtCEp9Mjlb0tmuhmcRmamhV4veNsie51c
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a56874f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=Um9VFfwTIzMb-0Dl9GAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3L4lL6mn92nTfp5zbbDQG32qmh31UX9S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX+//FOUyLNyZM
 mXcvQBkrCfG/0k1gRfduzgisfsvfr5wbjxw4MAynhsbiPcv9U2N7w3lXJ2JY+0pmHowxjMRrYxM
 M2R/s7eZ8JSu/XUJyyL6pH9fIKoIs0w=
X-Proofpoint-GUID: 3L4lL6mn92nTfp5zbbDQG32qmh31UX9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX3cwFy+KWfcbD
 RvV8os3GxW4/hFJk/dFaahbHsYCCYTtDnZ39HlH78jey4Z1HWDkOybyofBHHE2wP2TIM8T3aJBk
 O4WNS1mZxcghufsGxzljY8kDUioSGuMIL5jIQdDoAs3TAaxQRGs7cyixgl0mGqTzl3Nnz81SWVz
 gF7MNO/usBPlgvHVKO6OUy08gvCnZjQMmgZeCwOgla4Q74Qg4bPoATPWoyj/ht8Z0kRjKd0hVaR
 uARWN9zXRBrF/wzy7MEv95HQFNrgGKlp9pZhQvn3j28I9un2cKPJcrZn37kOXWyi0WXWL78GXDd
 e3KG5pUYL+e6bnubrrZPWfYA1aIlf8cXhj3DGOa/R/vkKPCcItrho9DBQ8Kb6768WA+YGt1H5ZN
 EUAZTsnZKgf/c4LmpXN1evt/X+HxaXHjl8koTGz0LMbPnUKkTGpMBYvAQbzzRvhNObyfDSgoxkC
 2IxRk4hasAgwe8joqNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119093-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A41075815E

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v2:
- Fix issues detected by Media CI robot and kernel test robot.
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/
- Rebase onto media-committers next.
- Update to handle p_s8 in std_validate_elem correctly. 
- Link to v1: https://lore.kernel.org/r/20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (3):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI support framework for iris video encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  14 +++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 101 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  16 +++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  62 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  40 +++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   3 +
 25 files changed, 439 insertions(+), 7 deletions(-)
---
base-commit: 6c3a86e563b5c79e4429d8aa4cde39b2485bf969
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


