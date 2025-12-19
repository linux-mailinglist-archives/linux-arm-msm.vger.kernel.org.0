Return-Path: <linux-arm-msm+bounces-85803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1ECCF330
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE1C306C722
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC062241663;
	Fri, 19 Dec 2025 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vl3TfyVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIltP6Oa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89861ADC97
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766137612; cv=none; b=RQrtimzKQ6BCeDR7klSZr2D868K6lQFOcAUEHqBxohEsy7VZWO49zWMK9Rm4Js6fsbtHsZtIZSzmXa40RQesuFD6PErdr7MdRgRzjh5m1LRuS7D/YcIuSeUI3YCPzjYV+okMeetI6xhzACaOsoqds8M3CmE0xD0AFFwmYxf7QM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766137612; c=relaxed/simple;
	bh=UgeeKg8DiFg6i7pkc6l/W34C92Y/c26pKUDj8fzMic0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lFZt4EK5uac56JDU7CdSl1eIoUTjCTfg5LP6WIo0OY+ZbQR3ID1ifKpvQWzucHgA6FdTbbMnSH9hq/d6kNXBytcfWymS2sX6K8gmglWJCy+91MppQl1Kqz5E0lltHup3+pJMl8Eru/hpRd1PuienZRJFB6zw2MexjfRPtL1AnwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vl3TfyVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIltP6Oa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c7fb091626
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yNrJRDri9PPF6LzAz3Agnb
	Vw1PVSZFM5bvJD37aUrkI=; b=Vl3TfyVe/cwVLJrsX2oECuOFXRWnjCt7NyCHaM
	Rxt82GBFGd1eNVHzbRfFmMiEMMlLXG1IvW95W2n9DX3H/MjUgFOdIF6kwPi7Xt/1
	19tOcamPjlX3JAuHpFXMyrYJiXtX+iViIaNvlC8IxT0ts8+071G8EnmYUACpMKyu
	/acKiNlz+2CXoI6updpZtM+3xA7UG4VrzUSLG7L/KA4KW+NYB5p4sms9wwwBRaa6
	8KuFOriqlxt4m9s2GZ48szN2qXFhDVC6Ixz6cHtap/vp99ntzaTZK19VrWBcVof6
	A+/mT1Voi0Ov33BtzVzvXFnhJ9ycpvGVrLhb3LlQUxq9mJQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea5pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:46:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6855557aso54819011cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766137609; x=1766742409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNrJRDri9PPF6LzAz3AgnbVw1PVSZFM5bvJD37aUrkI=;
        b=UIltP6OaDkbM3MZFAsz+aluGRaXvWHFHm4jNfib3gmTis44pw/zCoLgJBQuqeTDaBy
         3uIJ48cnrTSaRxztK4DJ/cO709XAJzU4w47mQmCjp8QHA1t1h3x7XtLCKJ8NFLDWSg81
         qYQ8Z7XFxTAJLpyHhZopvTbTGb7w+Uch+hIlroVQB1B0KXXuSqJrJfFwBDqy0BV1Gkwl
         dnZsXEr8Ud7zB5o7V07VVqmN986mJW+DBWu/nhex2Og+EYua7YpuBKX8ELcElAOD4fL5
         vnSX6iyaYd2U09ZrltaD/6dd7OmLn0UHCFgI6OawwMcMHSEElQmDNGI1N8i7mpH/xpVC
         XMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766137609; x=1766742409;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNrJRDri9PPF6LzAz3AgnbVw1PVSZFM5bvJD37aUrkI=;
        b=aPiI/LXqSCtoryseox1SE7xPXX5XTv3Wo/jgtfRNVl9SKP8bE+pgLON7zoOQRPL3+P
         4S82B2x0Xv9ceDRePRzdYbJk7iFS3C0jbRjqB5RBpOykyKwnrU9RHHeGKmSUzhGHsPIH
         9Y0KFXDd7WVICaczwoDif/F+8GH9UmVvDyYVVvWxHhnaRCZc1jf2aZMiY4exCAC3R6Df
         R7/7tuSUdXqqzIV4bR9TOfKoSqUJCpRtRxnYLqGTlopvVEEtNEtbEJrNm8KJN0XR5YTO
         KBwc9sDH7v6djfOzZlaIxhb89tgcbCApnsoXWiemY4n6G6Gh2dKaSojhDFrYJX2IbCti
         ORTg==
X-Gm-Message-State: AOJu0YxkT9K03S3zn231ETGb7eV96yOW2GwYluxdtUTN/UA9Q+A6osMb
	IAnQ40PQLXQ6RnxtW38nhBE4S5ZcXaQSKTKnqmsO+K8T7tdz21QfLNMH3tyO2Yt+QDg7xhOyu41
	0pbApTQhb85Wv8/rdbdfw5O3kqqGxk5i5E4AI9+BOU29lX5Z/kyv/e2Lky1GnjOQ56wYV
X-Gm-Gg: AY/fxX6iVsXEDmMN2cl8pj7a7eUaFzxmjN2YxDRyVREUsebismxPj68lMo8Nq/mRQQE
	yLpRxrF1urShLgmKFKqdwE9TbKu+ZjHYvN7Mrhdhr8sgebxSSahAoyPP6jDvmmSd1SK8MzgKo+g
	eU5s7De3ELv174lcKBY31FxX17mHdbFZAFvbUxDIUeAiTEJqv1b//DcQ+Mw2Kt3gaxOqUVvfuKW
	QF8Z2rGBk10kfRWIqvie8uDZoyi5W0cByN8rG6Sq+cFH/fT/TBildTwvQztt4Mx6doG9RiBKhFy
	NME5gBVFUKsI20mobL5zgi/L7RejHfEX1Kl41yiYLkdhlXvR/ii/iZshVBbiYd4ss2mOhxWwJoi
	t4L1Br1x88oE0qt3OJIH1HEHQquH5UIOdReLbJg==
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f35f4839ccmr77525951cf.41.1766137608760;
        Fri, 19 Dec 2025 01:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOzKIs56iuJuZbW+aHfYU6IEYP2i4PV69yPdLsmT/CQpMv8zcrpBF2T+5UD5Z6j9/j43Cyww==
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f35f4839ccmr77525781cf.41.1766137608341;
        Fri, 19 Dec 2025 01:46:48 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279d6d8sm88432755e9.10.2025.12.19.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:46:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 10:46:40 +0100
Subject: [PATCH v2] dmaengine: qcom: bam_dma: convert tasklet to a BH
 workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-bam-dma-bh-workqueue-v2-1-ed5eeab78cf0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP8eRWkC/x3MTQ5AMBBA4avIrE1SIwRXEYtWBxPx16ZIxN01l
 t/ivQc8O2EPTfKA41O8bGsEpQn0k15HRrHRQIqKjLIKjV7QLhrNhNfm5iNwYFS2UtwrU+Y1QUx
 3x4Pc/7bt3vcDM7WW7GYAAAA=
X-Change-ID: 20251218-bam-dma-bh-workqueue-0d80ec0b6392
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UgeeKg8DiFg6i7pkc6l/W34C92Y/c26pKUDj8fzMic0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRR8CHj0yF6MWzSU9gzn69UJn2l5AoyDsseODe
 8YabhyI8+CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUfAgAKCRAFnS7L/zaE
 w7erD/4nGR0CjpNdjRzYbT5x28RZ5Mk/yldcTIzVykIj41Vm/Nb3+KgHkgdjOEXU/Qw4wtRXKEY
 +DkrfaFxa2xmvLcs8lOFY+IT6ZWGK1UJqj1KiiK9maWthhnzthbuwJM1mI6uMD5/II+yUVu0Jrx
 8M3Ei8pYXUBWv3CNhySukyqd7WZCAZeNiuKdMO/A9rH5O9X4RYCqqU1zmb60GZOD0ftPm9caUPK
 dN24TAn+LBEUPu63FrKwBjIFMO/d5d3pu969xFguRVRn939AH2jdNFjqKfo4FJiXZqZwDU2cNi2
 wiyXmz3MFEPWvTXrIUSVAR35x4lKj9Yxw//QBLNB1NxRAUFZ2Rn6oBzcoYHJZeaSo8vM7P8mpvY
 AWrvPV9GpBFH8NJBHbnO1Xy9H4go4xs+LmFAN+bpgOd8z1I8bdQAewk9rn51Mv18MFUxqf/1Dji
 ACgteVPNlKsepNEQTvuqjhSGavZ0SBYuq6I/JX2ZhQhB2R7cJACCw2cr17a8h+8rJebQIzuwaLr
 aa17I9FMn5fV08QuaMYJLbdEsdAM4jMY+1hniaYXBccXTDWJlHccZu3gnSLw6A83Cqh1UuK8ef3
 GJMRO48AQybgve3ANllM1YnpcekbRubHL2E9za4hjbfP/OHW6LrmPqi7WvjacmTkCYTsRI3lMoM
 4tBGWsXmVzD3QuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3OSBTYWx0ZWRfXz0ocXnVec8xx
 TKe9RgpZBIZnNnwKVYQeGvahE/nJMR9bUDOx4tzmnBKq3ySKZ1sSPXJ3diWIUxmgNiFLfj611yo
 tx4l/mdmPELqr2619zIOkWYDI6DvFFoDjFuXdcg/7mdQ33hjzE6fEmSChWFKB/oQGayfxW5Clta
 wCeOA25+iZQ33EIDYmQ5axQdIv4tQa0ghMXc2C/OcTEcz+1ntH66YC5GCNF0p3vmzwFf9vx5U9j
 h6NxVrA7CsRgLB9aHHzApIjNKinRdD3AkL+Y5PWzCQ+Ig05IZ1P73Y2sj6V43hSXvgplo6gzQ9c
 Q4111IHwYrB2GShAAQC775nVPfHU43fFsU7nGuGpspADfTkrkZCGpkJdVoqwO1niu0XpetnOy+7
 SKGzr51wyLrmYrKIigTjwukiE2cB1YdkNBdYdNC685/EZx7AkDyg96qWbxPQE1skF76Rx2KxsAU
 CnZeIGNnneo47p8qUIA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69451f09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DbC-kSREOKCiu4c6wCYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kufxiAatEW6VhlLOw7vPYwWskL_NlErr
X-Proofpoint-GUID: kufxiAatEW6VhlLOw7vPYwWskL_NlErr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190079

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Tested with the Qualcomm Crypto Engine with no impact on stability or
performance (according to cryptsetup benchmark).

Changes in v2:
- Use the high-priority BH workqueue
- Link to v1: https://lore.kernel.org/all/20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org/
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bcd8de9a9a12621a36b49c31bff96f474468be06..509d9296f6d7ef7662325e39fa12b6db45badbec 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -869,7 +870,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -899,9 +900,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1097,14 +1098,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1117,14 +1118,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1292,14 +1292,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1364,8 +1364,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1399,7 +1399,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

---
base-commit: 970d7fed472fd561d12773ff445497f847b7161d
change-id: 20251218-bam-dma-bh-workqueue-0d80ec0b6392

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


